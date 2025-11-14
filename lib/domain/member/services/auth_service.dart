import 'package:flutter/material.dart';
import 'package:take_breath/domain/member/services/auth_storage.dart';

final GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();
Future<void> logoutAndRedirect() async {
  await AuthStorage.clear(); // 인증 정보 삭제

  // globalNavigatorKey를 사용하여 페이지 이동
  globalKey.currentState?.pushNamedAndRemoveUntil(
    '/social_page',
    (route) => false,
  );
}
