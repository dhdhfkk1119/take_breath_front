import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:vibration/vibration.dart';
import 'package:audioplayers/audioplayers.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  late AudioPlayer _audioPlayer;
  bool _isInitialized = false;

  bool notificationEnabled = true;
  bool soundEnabled = true;
  bool vibrationEnabled = true;

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> setNotificationEnabled(bool value) async {
    notificationEnabled = value;
  }

  Future<void> setSoundEnabled(bool value) async {
    soundEnabled = value;
  }

  Future<void> setVibrationEnabled(bool value) async {
    vibrationEnabled = value;
  }

  Future<void> initialize() async {
    if (_isInitialized) return;
    _audioPlayer = AudioPlayer();
    _isInitialized = true;

    // 로컬 알림 초기화
    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: androidSettings);
    await _flutterLocalNotificationsPlugin.initialize(initSettings);
  }

  Future<void> showNotification({
    required String title,
    required String body,
  }) async {
    if (!notificationEnabled) return;

    // 소리 재생
    if (soundEnabled) {
      await _audioPlayer.play(AssetSource('sounds/notification.mp3'));
    }

    // 진동
    if (vibrationEnabled) {
      await Vibration.vibrate(pattern: [0, 250, 250, 250]);
    }

    // 로컬 알림 표시
    const androidDetails = AndroidNotificationDetails(
      'channel_id',
      'SSE & FCM Notifications',
      importance: Importance.max,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
    );
    const notificationDetails = NotificationDetails(android: androidDetails);

    await _flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
    );
  }

  // SSE 전용 메시지 처리
  Future<void> onMessageReceived(String message) async {
    await showNotification(title: '새 알림', body: message);
  }
}
