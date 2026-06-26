// lib/features/reader/screens/reader_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/reader_bloc.dart';
import '../bloc/reader_event.dart';
import '../bloc/reader_state.dart';

class ReaderScreen extends StatelessWidget {
  final String chapterUrl;

  const ReaderScreen({super.key, required this.chapterUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đọc truyện'),
        backgroundColor: Colors.blueGrey,
      ),
      // Cung cấp ReaderBloc cho màn hình này và lập tức gọi sự kiện LoadChapterEvent
      body: BlocProvider(
        create: (context) => ReaderBloc()..add(LoadChapterEvent(chapterUrl)),
        // BlocBuilder: Widget thần thánh giúp thay đổi giao diện theo State
        child: BlocBuilder<ReaderBloc, ReaderState>(
          builder: (context, state) {
            // --- XỬ LÝ THEO TỪNG TRẠNG THÁI ---

            // 1. Nếu đang tải: Hiện vòng xoay ở giữa màn hình
            if (state is ReaderLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            // 2. Nếu lỗi: Hiện chữ màu đỏ
            else if (state is ReaderError) {
              return Center(
                child: Text('Lỗi: ${state.errorMessage}', style: const TextStyle(color: Colors.red)),
              );
            }

            // 3. Nếu thành công: Hiện nội dung truyện cho phép cuộn (Scroll)
            else if (state is ReaderLoaded) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  state.content,
                  style: const TextStyle(fontSize: 18, height: 1.6), // Cỡ chữ 18, giãn dòng 1.6
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}