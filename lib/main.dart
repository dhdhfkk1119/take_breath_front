import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/presentation/pages/auth/social/social_page.dart';
import 'package:take_breath/presentation/pages/index_stack_page/main_screen.dart';
import 'package:take_breath/presentation/pages/index_stack_page/service/notification_service.dart';
import 'package:take_breath/presentation/pages/splash/splash_screen.dart';
import 'package:timeago/timeago.dart' as timeago;

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Flutter 엔진 초기화

  timeago.setLocaleMessages('ko', timeago.KoMessages());
  timeago.setDefaultLocale('ko');

  // NotificationService 초기화
  await NotificationService().initialize(); // 알람 기능 초기화

  runApp(
    // 전체에 리버팟 사용 가능 앱
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        "/social_page": (context) => const SocialPage(),
        "/main": (context) => const MainScreen(),
      },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ko', 'KR'),
        Locale('en', 'US'),
      ],
    );
  }
}
