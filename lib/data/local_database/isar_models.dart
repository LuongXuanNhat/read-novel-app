// lib/data/local_database/isar_models.dart
import 'package:isar/isar.dart';

// DÒNG NÀY RẤT QUAN TRỌNG: Báo cho Flutter biết file tự sinh ra sẽ tên là gì
part 'isar_models.g.dart'; // Neu loix, chay dong: flutter pub run build_runner build --delete-conflicting-outputs

@collection
class NovelLocal {
  Id id = Isar.autoIncrement; // ID tự tăng

  @Index(unique: true, replace: true)
  String sourceUrl = ''; // Link gốc truyện (dùng làm key để tìm kiếm)

  String title = '';
  String author = '';
  String coverUrl = '';
  String domain = '';

  DateTime? lastAccessed; // Thời gian truy cập cuối (Để sort danh sách)
  int lastReadChapterIndex = 0; // Chương đang đọc dở (Để bấm nút "Đọc tiếp")
  bool isFavorite = false; // Đánh dấu truyện yêu thích
}

@collection
class ChapterLocal {
  Id id = Isar.autoIncrement;

  @Index()
  String novelUrl = ''; // Link truyện chứa chương này (Khóa ngoại)

  int chapterIndex = 0; // STT chương (1, 2, 3...)
  String title = '';

  @Index(unique: true, replace: true)
  String url = ''; // Link của chương

  String content = ''; // Nội dung truyện (text)
  bool isDownloaded = false; // Trạng thái đã tải offline chưa

  double scrollOffset = 0.0; // Vị trí cuộn (Lưu lại để không bắt đầu từ trên cùng)
}

@collection
class DownloadTaskLocal {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String novelUrl = ''; // Khóa chính để biết truyện nào đang tải

  String novelTitle = '';

  int startChapter = 0; // Tải từ chương
  int endChapter = 0;   // Đến chương
  int currentChapter = 0; // ĐANG TẢI DỞ Ở CHƯƠNG NÀO (Đây chính là FLAG của bạn)

  // Trạng thái: 0 = Đang tải, 1 = Tạm dừng/Lỗi mạng, 2 = Hoàn thành
  int status = 0;
}