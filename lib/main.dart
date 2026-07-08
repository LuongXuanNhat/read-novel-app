// lib/main.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter__first_app/core/utils/notification_service.dart';
import 'package:flutter__first_app/features/home/screens/main_tab_screen.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'data/local_database/isar_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  IsarService();

  // 1. Khởi tạo Notification
  await NotificationService().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Đọc Truyện',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Bật app lên là chọc thẳng vào màn hình Reader để test
      home: const MainTabScreen(),
    );
  }
}