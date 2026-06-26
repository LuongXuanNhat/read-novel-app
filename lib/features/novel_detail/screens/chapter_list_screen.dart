import 'dart:async'; // Bắt buộc import để dùng StreamSubscription
import 'package:flutter/material.dart';
import 'package:flutter__first_app/data/scrapers/base_scraper.dart';
import 'package:flutter__first_app/data/scrapers/metruyenchu_scraper.dart';
import 'package:flutter__first_app/data/scrapers/truyenhay_scraper.dart';
import '../../../data/models/novel.dart';
import '../../../data/models/chapter.dart';
import '../../../data/scrapers/truyenfull_scraper.dart';
import '../../download/download_manager.dart';
import '../../../data/local_database/isar_service.dart';
import '../../../core/utils/notification_service.dart';

class ChapterListScreen extends StatefulWidget {
  final Novel novel;

  const ChapterListScreen({super.key, required this.novel});

  @override
  State<ChapterListScreen> createState() => _ChapterListScreenState();
}

class _ChapterListScreenState extends State<ChapterListScreen> {
  final List<Chapter> _chapters = [];
  bool _isScrapingFinished = false; // Cờ kiểm tra cào xong chưa
  StreamSubscription? _subscription; // Quản lý luồng
  final DownloadManager _downloadManager = DownloadManager();

  @override
  void initState() {
    super.initState();
    _startStreamingChapters();
    _checkPendingDownload();
  }

  Future<void> _checkPendingDownload() async {
    final pendingTask = await IsarService().getPendingTask(widget.novel.sourceUrl);

    // Nếu có task dở (status = 1) và màn hình vẫn đang mở
    if (pendingTask != null && mounted) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Phát hiện tải dở'),
          content: Text('Lần trước bạn đang tải dở từ chương ${pendingTask.startChapter} đến ${pendingTask.endChapter}. Bạn bị dừng ở chương ${pendingTask.currentChapter}.\n\nBạn có muốn tải tiếp không?'),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Hủy bỏ')
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                // BẮT ĐẦU TẢI TIẾP TỪ CHƯƠNG BỊ LỖI
                _executeDownload(pendingTask.currentChapter, pendingTask.endChapter);
              },
              child: const Text('Tải tiếp'),
            ),
          ],
        ),
      );
    }
  }

  Future<void> _executeDownload(int startChapter, int endChapter) async {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Bắt đầu tải trong nền từ $startChapter đến $endChapter. Vui lòng xem thông báo!'))
    );

    int notificationId = widget.novel.sourceUrl.hashCode; // Tạo ID thông báo duy nhất cho truyện này

    try {
      await _downloadManager.startDownload(
        novel: widget.novel,
        allChapters: _chapters,
        startIdx: startChapter,
        endIdx: endChapter,
        onProgress: (currentCount, total) {
          // BẮN THÔNG BÁO PROGRESS LÊN ANDROID
          NotificationService().showProgressNotification(
            id: notificationId,
            title: widget.novel.title,
            progress: currentCount,
            maxProgress: total,
          );
        },
      );

      // Khi tải xong (Vòng lặp trong DownloadManager chạy mượt mà)
      NotificationService().cancelNotification(notificationId);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Đã tải hoàn tất! Bạn có thể đọc ngoại tuyến.', style: TextStyle(color: Colors.green))),
        );
      }
    } catch (e) {
      // Nếu có lỗi nhảy vào đây
      NotificationService().cancelNotification(notificationId);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Tải bị dừng do lỗi: $e. Sẽ hỏi lại vào lần sau.', style: const TextStyle(color: Colors.red))),
        );
      }
    }
  }

  @override
  void dispose() {
    _subscription?.cancel(); // Phải hủy Stream khi thoát màn hình để không tốn RAM
    super.dispose();
  }

  void _startStreamingChapters() {
    // TỰ ĐỘNG CHỌN TOOL CÀO DỰA VÀO LINK TRUYỆN
    BaseScraper scraper;
    if (widget.novel.sourceUrl.contains('truyenfull.today')) {
      scraper = TruyenFullScraper();
    } else if (widget.novel.sourceUrl.contains('metruyenchuvn.com')) {
      scraper = MetruyenchuScraper();
    } else if(widget.novel.sourceUrl.contains('truyenhay.app')){
      scraper = TruyenHayScraper();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Nguồn truyện chưa được hỗ trợ!')));
      return;
    }

    _subscription = scraper.streamChapterPages(widget.novel.sourceUrl).listen(
          (List<Chapter> pageChapters) {
        setState(() {
          _chapters.addAll(pageChapters);
        });
      },
      onDone: () {
        setState(() => _isScrapingFinished = true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Đã quét xong ${_chapters.length} chương!')),
        );
      },
      onError: (error) {
        setState(() => _isScrapingFinished = true);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Lỗi: $error')));
      },
    );
  }

  // HỘP THOẠI CHỌN TẢI TỪ CHƯƠNG X ĐẾN Y (Giữ nguyên code hôm trước của bạn)
  void _showDownloadDialog() {
    final TextEditingController startCtrl = TextEditingController();
    final TextEditingController endCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Tải truyện ngoại tuyến', style: TextStyle(fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tổng số chương: ${_chapters.length}', style: const TextStyle(color: Colors.blue)),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: startCtrl,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Từ chương (X)', border: OutlineInputBorder()),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: endCtrl,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Đến chương (Y)', border: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text('Lưu ý: Tải tối đa 500 chương/lần', style: TextStyle(color: Colors.red, fontSize: 12, fontStyle: FontStyle.italic)),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Hủy', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              onPressed: () {
                int? start = int.tryParse(startCtrl.text);
                int? end = int.tryParse(endCtrl.text);

                // KIỂM TRA ĐIỀU KIỆN
                if (start == null || end == null) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Vui lòng nhập số hợp lệ')));
                  return;
                }
                if (start < 1 || start > end || end > _chapters.length) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Khoảng chương không hợp lệ')));
                  return;
                }
                if (end - start + 1 > 500) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Chỉ được tải tối đa 500 chương mỗi lần')));
                  return;
                }

                // 1. Đóng Hộp thoại
                Navigator.pop(context);

                // 2. Chạy hàm bắt đầu tải (Hàm này chúng ta sẽ viết ở bước sau)
                _executeDownload(start, end);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
              child: const Text('Tải xuống'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.novel.title, style: const TextStyle(fontSize: 16)),
        actions: [
          IconButton(
            icon: Icon(Icons.download, color: _isScrapingFinished ? Colors.blue : Colors.grey),
            // CHỈ MỞ NÚT TẢI KHI ĐÃ QUÉT XONG DANH SÁCH CHƯƠNG
            onPressed: _isScrapingFinished && _chapters.isNotEmpty ? _showDownloadDialog : null,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: Container(
            color: Colors.grey.shade200,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              _isScrapingFinished
                  ? 'Hoàn thành: ${_chapters.length} chương'
                  : 'Đang quét danh sách... Đã tìm thấy ${_chapters.length} chương',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: _isScrapingFinished ? Colors.green.shade700 : Colors.orange.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
      body: _chapters.isEmpty && !_isScrapingFinished
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _chapters.length,
        // Giao diện tự động phân trang theo chiều dọc (Cuộn vô hạn)
        itemBuilder: (context, index) {
          final chapter = _chapters[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 18,
              child: Text('${chapter.index}', style: const TextStyle(fontSize: 12)),
            ),
            title: Text(chapter.title, maxLines: 2, overflow: TextOverflow.ellipsis),
            trailing: const Icon(Icons.cloud_download_outlined, color: Colors.grey),
          );
        },
      ),
    );
  }
}