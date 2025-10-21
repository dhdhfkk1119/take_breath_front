import 'package:flutter/material.dart';
import 'package:take_breath/presentation/pages/index_stack_page/community/list_page/community_list_page.dart';
import 'package:take_breath/presentation/pages/index_stack_page/main_screen.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // WidgetRef 추가
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
      routes: {
        "/main": (context) => const MainScreen(),
      },
    );
  }
}
