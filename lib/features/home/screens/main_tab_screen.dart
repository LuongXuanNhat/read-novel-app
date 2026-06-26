import 'package:flutter/material.dart';
import 'package:flutter__first_app/features/home/screens/download_history_screen.dart';
import 'package:flutter__first_app/features/home/screens/favorite_novels_screen.dart';
import 'library_screen.dart'; // Màn hình Thư viện cũ của bạn

class MainTabScreen extends StatefulWidget {
  const MainTabScreen({super.key});

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  int _currentIndex = 1; // Mặc định mở Tab số 1 (Thư viện)

  // Danh sách các màn hình tương ứng với từng Tab
  final List<Widget> _screens = [
    const FavoriteNovelsScreen(), // Tab 0
    const LibraryScreen(), // Tab 1
    const DownloadHistoryScreen(), // Tab 2 (Lát nữa ta tạo)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack giúp giữ nguyên trạng thái (không load lại) khi chuyển Tab
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Của tôi'),
          BottomNavigationBarItem(icon: Icon(Icons.library_books), label: 'Thư viện'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Lịch sử tải'),
        ],
      ),
    );
  }
}