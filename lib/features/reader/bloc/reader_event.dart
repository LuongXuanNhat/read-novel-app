// lib/features/reader/bloc/reader_event.dart
abstract class ReaderEvent {}

// Sự kiện yêu cầu tải nội dung 1 chương
class LoadChapterEvent extends ReaderEvent {
  final String url;
  LoadChapterEvent(this.url);
}