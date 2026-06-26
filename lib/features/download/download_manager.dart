import 'package:flutter__first_app/data/scrapers/base_scraper.dart';
import 'package:flutter__first_app/data/scrapers/metruyenchu_scraper.dart';
import 'package:flutter__first_app/data/scrapers/truyenhay_scraper.dart';

import '../../data/local_database/isar_models.dart';
import '../../data/local_database/isar_service.dart';
import '../../data/models/chapter.dart';
import '../../data/models/novel.dart';
import '../../data/scrapers/truyenfull_scraper.dart';

class DownloadManager {
  final IsarService _dbService = IsarService();

  // Số chương tải song song. 3-5 là mức an toàn cho hầu hết site scrape
  // (tăng quá cao dễ bị chặn IP / timeout dồn cục).
  static const int _maxConcurrent = 4;

  Future<void> startDownload({
    required Novel novel,
    required List<Chapter> allChapters,
    required int startIdx,
    required int endIdx,
    Function(int current, int total)? onProgress,
  }) async {
    BaseScraper scraper;
    if (novel.sourceUrl.contains('truyenfull.today')) {
      scraper = TruyenFullScraper();
    } else if (novel.sourceUrl.contains('metruyenchuvn.com')) {
      scraper = MetruyenchuScraper();
    } else if (novel.sourceUrl.contains('truyenhay.app')) {
      scraper = TruyenHayScraper();
    } else {
      throw Exception('Không hỗ trợ nguồn này');
    }

    final novelLocal = NovelLocal()
      ..title = novel.title
      ..author = novel.author
      ..coverUrl = novel.coverUrl
      ..sourceUrl = novel.sourceUrl
      ..domain = novel.domain
      ..lastAccessed = DateTime.now();
    await _dbService.saveNovel(novelLocal);

    final task = DownloadTaskLocal()
      ..novelUrl = novel.sourceUrl
      ..novelTitle = novel.title
      ..startChapter = startIdx
      ..endChapter = endIdx
      ..currentChapter = startIdx
      ..status = 0;
    await _dbService.updateDownloadTask(task);

    final totalInRange = endIdx - startIdx + 1;
    List<Chapter> wanted = allChapters.where((c) => c.index >= startIdx && c.index <= endIdx).toList();

    // Resume đúng cách: bỏ qua chương đã có trong DB, vì với tải song song
    // thứ tự hoàn thành không còn tuyến tính nên không thể chỉ dựa vào
    // currentChapter như code cũ.
    final downloadedIdx = await _dbService.getDownloadedChapterIndexes(novel.sourceUrl);
    List<Chapter> toDownload = wanted.where((c) => !downloadedIdx.contains(c.index)).toList();

    int doneCount = totalInRange - toDownload.length; // số đã có từ trước
    if (toDownload.isEmpty) {
      task.status = 2;
      await _dbService.updateDownloadTask(task);
      onProgress?.call(totalInRange, totalInRange);
      print('ĐÃ TẢI XONG TOÀN BỘ (resume, không còn chương thiếu)!');
      return;
    }

    bool hasError = false;
    int highestCompleted = startIdx - 1;
    int nextIdx = 0; // con trỏ chia job cho các worker

    Future<void> downloadOne(Chapter chapter) async {
      try {
        print('Đang tải ngoại tuyến: Chương ${chapter.index}');
        final content = await scraper.getChapterContent(chapter.url);

        final chapterLocal = ChapterLocal()
          ..novelUrl = novel.sourceUrl
          ..chapterIndex = chapter.index
          ..title = chapter.title
          ..url = chapter.url
          ..content = content
          ..isDownloaded = true;
        await _dbService.saveChapter(chapterLocal);

        doneCount++;
        if (chapter.index > highestCompleted) highestCompleted = chapter.index;
        task.currentChapter = highestCompleted;
        await _dbService.updateDownloadTask(task);

        onProgress?.call(doneCount, totalInRange);
      } catch (e) {
        print('LỖI MẤT MẠNG HOẶC WEB CHẶN TẠI CHƯƠNG ${chapter.index}: $e');
        hasError = true;
      }
    }

    // Mỗi worker: lấy job kế tiếp -> delay nhẹ -> tải -> lặp lại.
    Future<void> worker() async {
      while (nextIdx < toDownload.length) {
        final chapter = toDownload[nextIdx++]; // tăng đồng bộ, an toàn vì không có await trước đó
        await Future.delayed(const Duration(milliseconds: 150));
        await downloadOne(chapter);
      }
    }

    await Future.wait(List.generate(_maxConcurrent, (_) => worker()));

    if (hasError) {
      task.status = 1; // lần sau gọi lại startDownload sẽ tự skip chương đã xong
      await _dbService.updateDownloadTask(task);
      print('TẢI BỊ DỪNG DO LỖI, ĐÃ LƯU TIẾN ĐỘ.');
      return;
    }

    task.status = 2;
    await _dbService.updateDownloadTask(task);
    print('ĐÃ TẢI XONG TOÀN BỘ!');
  }
}