import 'package:flutter_client_sse/flutter_client_sse.dart';
import 'package:flutter_client_sse/constants/sse_request_type_enum.dart';
import 'package:take_breath/_core/utils/jwt_util.dart';
import 'package:take_breath/_core/utils/my_http.dart';
import 'package:take_breath/domain/member/services/auth_service.dart';
import 'package:take_breath/domain/member/services/auth_storage.dart';
import 'notification_service.dart';

Future<void> connectSSE() async {
  String? accessToken = await AuthStorage.getAccessToken();

  if (accessToken == null || JwtUtil.isExpired(accessToken)) {
    final refreshToken = await AuthStorage.getRefreshToken();

    if (refreshToken != null && !JwtUtil.isExpired(refreshToken)) {
      final response = await dio.post(
        '/members/refresh',
        data: {'refreshToken': refreshToken},
      );

      if (response.statusCode == 200) {
        final newAccessToken = response.data['accessToken'];
        await AuthStorage.saveTokens(newAccessToken, refreshToken);
        accessToken = newAccessToken;
      } else {
        print("refresh 요청 실패 — 재로그인 필요");
        await logoutAndRedirect();
        return;
      }
    } else {
      print("refreshToken도 만료 — 재로그인 필요");
      await logoutAndRedirect();
      return;
    }
  }

  SSEClient.subscribeToSSE(
    url: "$baseUrl/notifications/subscribe",
    method: SSERequestType.GET,
    header: {'Authorization': 'Bearer $accessToken'},
  ).listen((event) async {
    final message = event.data ?? '';
    await NotificationService().onMessageReceived(message);
  }, onError: (error) async {
    print("SSE 연결 오류: $error");
  });
}
