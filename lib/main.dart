import 'package:flutter/material.dart';
import 'package:take_breath/presentation/pages/index_stack_page/community/list_page/community_list_page.dart';
import 'package:take_breath/presentation/pages/index_stack_page/main_screen.dart';
import 'package:take_breath/presentation/pages/splash/splash_screen.dart'; // 스플래쉬 화면 import

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(), // 스플래쉬 화면을 첫 화면으로 설정
      routes: {
        "/main": (context) => const MainScreen(),
      },
    );
  }
}
