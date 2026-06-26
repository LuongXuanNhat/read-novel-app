// lib/features/reader/bloc/reader_state.dart
abstract class ReaderState {}

// Trạng thái 1: Mới mở màn hình, hiện vòng xoay tải dữ liệu
class ReaderLoading extends ReaderState {}

// Trạng thái 2: Tải thành công, chứa nội dung truyện để UI hiển thị
class ReaderLoaded extends ReaderState {
  final String content;
  ReaderLoaded(this.content);
}

// Trạng thái 3: Tải thất bại, chứa câu thông báo lỗi
class ReaderError extends ReaderState {
  final String errorMessage;
  ReaderError(this.errorMessage);
}