import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'notification_service.dart';

Future<void> initFirebaseMessaging() async {
  await Firebase.initializeApp();

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  await messaging.requestPermission();

  final token = await messaging.getToken();
  print("📱 FCM Token: $token");

  // 포그라운드 알림
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    NotificationService().showNotification(
      title: message.notification?.title ?? '새 알림',
      body: message.notification?.body ?? '',
    );
  });

  // 백그라운드 / 종료 알림
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await NotificationService().showNotification(
    title: message.notification?.title ?? '새 알림',
    body: message.notification?.body ?? '',
  );
}
