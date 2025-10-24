import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:take_breath/presentation/pages/auth/social/social_page.dart';
import 'package:take_breath/presentation/pages/index_stack_page/community/list_page/community_list_page.dart';
import 'package:take_breath/presentation/pages/index_stack_page/main_screen.dart';
import 'package:take_breath/presentation/pages/splash/splash_screen.dart';

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
      home: const SplashScreen(),
      routes: {
        "/social_page": (context) => const SocialPage(),
        "/community_list_page": (context) => const CommunityListPage(),
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
