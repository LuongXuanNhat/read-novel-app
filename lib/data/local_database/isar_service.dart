import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'isar_models.dart';

class IsarService {
  late Future<Isar> db;

  // Singleton pattern: Đảm bảo app chỉ mở 1 kết nối Database
  static final IsarService _instance = IsarService._internal();
  factory IsarService() => _instance;
  IsarService._internal() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [NovelLocalSchema, ChapterLocalSchema, DownloadTaskLocalSchema],
        directory: dir.path,
        inspector: true, // Cho phép xem data trên web khi debug
      );
    }
    return Future.value(Isar.getInstance());
  }

  // --- 1. LƯU THÔNG TIN TRUYỆN ---
  Future<void> saveNovel(NovelLocal novel) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.novelLocals.put(novel);
    });
  }

  // --- 2. LƯU NỘI DUNG 1 CHƯƠNG ---
  Future<void> saveChapter(ChapterLocal chapter) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.chapterLocals.put(chapter);
    });
  }

  // --- 3. CẬP NHẬT FLAG TIẾN ĐỘ TẢI ---
  Future<void> updateDownloadTask(DownloadTaskLocal task) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.downloadTaskLocals.put(task);
    });
  }

  // --- 4. LẤY TASK ĐANG TẢI DỞ (Để lát check khi mở app) ---
  Future<DownloadTaskLocal?> getPendingTask(String novelUrl) async {
    final isar = await db;
    return await isar.downloadTaskLocals
        .filter()
        .novelUrlEqualTo(novelUrl)
        .and()
        .statusEqualTo(1) // 1 là trạng thái đang bị dừng do lỗi/tắt app
        .findFirst();
  }

  // --- LẤY DANH SÁCH TRUYỆN ĐÃ TẢI (SORT THEO THỜI GIAN TRUY CẬP) ---
  Future<List<NovelLocal>> getDownloadedNovels() async {
    final isar = await db;
    // Sắp xếp giảm dần (Mới nhất lên đầu)
    return await isar.novelLocals.where().sortByLastAccessedDesc().findAll();
  }

  // --- CẬP NHẬT THỜI GIAN TRUY CẬP KHI BẤM VÀO TRUYỆN ---
  Future<void> updateLastAccessed(String sourceUrl) async {
    final isar = await db;
    final novel = await isar.novelLocals
        .filter()
        .sourceUrlEqualTo(sourceUrl)
        .findFirst();
    if (novel != null) {
      novel.lastAccessed = DateTime.now(); // Cập nhật thành giờ hiện tại
      await isar.writeTxn(() async {
        await isar.novelLocals.put(novel);
      });
    }
  }

  // --- LẤY TẤT CẢ CÁC CHƯƠNG ĐÃ TẢI CỦA 1 TRUYỆN ---
  Future<List<ChapterLocal>> getDownloadedChapters(String novelUrl) async {
    final isar = await db;
    return await isar.chapterLocals
        .filter()
        .novelUrlEqualTo(novelUrl)
        .sortByChapterIndex() // Sắp xếp theo STT chương 1, 2, 3...
        .findAll();
  }

  // --- 1. LẤY CHƯƠNG THEO SỐ THỨ TỰ (Dùng cho nút Next/Prev) ---
  Future<ChapterLocal?> getChapterByIndex(String novelUrl, int index) async {
    final isar = await db;
    return await isar.chapterLocals
        .filter()
        .novelUrlEqualTo(novelUrl)
        .and()
        .chapterIndexEqualTo(index)
        .findFirst();
  }

  // --- 2. LƯU TIẾN ĐỘ ĐỌC (Đang đọc tới chương mấy) ---
  Future<void> updateReadingProgress(String novelUrl, int chapterIndex) async {
    final isar = await db;
    final novel = await isar.novelLocals
        .filter()
        .sourceUrlEqualTo(novelUrl)
        .findFirst();
    if (novel != null) {
      novel.lastReadChapterIndex = chapterIndex;
      await isar.writeTxn(() async {
        await isar.novelLocals.put(novel);
      });
    }
  }

  // --- 3. LƯU VỊ TRÍ CUỘN CỦA 1 CHƯƠNG (Scroll Offset) ---
  Future<void> updateScrollOffset(int chapterId, double offset) async {
    final isar = await db;
    final chapter = await isar.chapterLocals.get(chapterId);
    if (chapter != null) {
      chapter.scrollOffset = offset;
      await isar.writeTxn(() async {
        await isar.chapterLocals.put(chapter);
      });
    }
  }

  // --- XÓA TRUYỆN VÀ TOÀN BỘ CHƯƠNG ĐÃ TẢI ---
  Future<void> deleteNovels(List<String> novelUrls) async {
    final isar = await db;

    await isar.writeTxn(() async {
      for (String url in novelUrls) {
        // 1. Xóa toàn bộ chương của truyện này
        await isar.chapterLocals.filter().novelUrlEqualTo(url).deleteAll();

        // 2. Xóa các Task đang tải dở (nếu có)
        await isar.downloadTaskLocals.filter().novelUrlEqualTo(url).deleteAll();

        // 3. Xóa thông tin truyện
        await isar.novelLocals.filter().sourceUrlEqualTo(url).deleteAll();
      }
    });
  }

  // --- LẤY DANH SÁCH TRUYỆN YÊU THÍCH ---
  Future<List<NovelLocal>> getFavoriteNovels() async {
    final isar = await db;
    return await isar.novelLocals
        .filter()
        .isFavoriteEqualTo(true) // Chỉ lấy truyện có cờ Yêu thích
        .sortByLastAccessedDesc()
        .findAll();
  }

  // --- BẬT/TẮT TRẠNG THÁI YÊU THÍCH ---
  Future<void> toggleFavorite(String novelUrl, bool isFav) async {
    final isar = await db;
    final novel = await isar.novelLocals
        .filter()
        .sourceUrlEqualTo(novelUrl)
        .findFirst();
    if (novel != null) {
      novel.isFavorite = isFav;
      await isar.writeTxn(() async {
        await isar.novelLocals.put(novel);
      });
    }
  }

  Future<Set<int>> getDownloadedChapterIndexes(String novelUrl) async {
    final isar = await db; // tuỳ theo cách bạn expose Isar instance hiện tại
    final list = await isar.chapterLocals
        .filter()
        .novelUrlEqualTo(novelUrl)
        .isDownloadedEqualTo(true)
        .chapterIndexProperty()
        .findAll();
    return list.toSet();
  }
}
