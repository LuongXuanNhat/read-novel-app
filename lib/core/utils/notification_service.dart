import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher'); // Icon mặc định của app

    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await _notificationsPlugin.initialize(settings: initializationSettings);
  }

  // Hàm hiện thanh Progress Bar lên thông báo
  Future<void> showProgressNotification({
    required int id,
    required String title,
    required int progress,
    required int maxProgress,
  }) async {
    final AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'download_channel',
      'Tải truyện offline',
      channelDescription: 'Hiển thị tiến trình tải truyện',
      channelShowBadge: false,
      importance: Importance.low, // Để low để không kêu bíp bíp liên tục
      priority: Priority.low,
      onlyAlertOnce: true,
      showProgress: true,       // BẬT THANH TIẾN ĐỘ
      maxProgress: maxProgress, // Tổng số chương
      progress: progress,       // Số chương đã tải
    );

    final NotificationDetails details = NotificationDetails(android: androidDetails);

    await _notificationsPlugin.show(
      id: id,
      title: title,
      body: progress == maxProgress ? 'Đã tải xong!' : 'Đang tải: $progress/$maxProgress chương',
      notificationDetails: details,
    );
  }

  // Xóa thông báo khi tải xong hoặc lỗi
  Future<void> cancelNotification(int id) async {
    await _notificationsPlugin.cancel(id: id);
  }
}