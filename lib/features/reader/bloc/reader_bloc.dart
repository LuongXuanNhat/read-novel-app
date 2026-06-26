// lib/features/reader/bloc/reader_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'reader_event.dart';
import 'reader_state.dart';
import '../../../data/scrapers/truyenfull_scraper.dart';
// Lưu ý: Tạm thời gọi cứng TruyenFullScraper để test, sau này sẽ dùng ScraperManager

class ReaderBloc extends Bloc<ReaderEvent, ReaderState> {
  final _scraper = TruyenFullScraper();

  ReaderBloc() : super(ReaderLoading()) {
    // Lắng nghe sự kiện LoadChapterEvent
    on<LoadChapterEvent>((event, emit) async {
      // 1. Báo cho UI biết đang tải -> Hiện vòng xoay
      emit(ReaderLoading());

      try {
        // 2. Gọi Scraper đi cào dữ liệu
        String text = await _scraper.getChapterContent(event.url);

        // 3. Có dữ liệu rồi -> Báo cho UI hiển thị chữ
        emit(ReaderLoaded(text));

      } catch (e) {
        // 4. Có lỗi -> Báo cho UI hiển thị lỗi
        emit(ReaderError(e.toString()));
      }
    });
  }
}