import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:take_breath/_core/utils/my_http.dart';
import 'auth_storage.dart';

class AuthInterceptor extends Interceptor {
  final GlobalKey<NavigatorState> navigatorKey;

  AuthInterceptor({required this.navigatorKey});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await AuthStorage.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // 401 Unauthorized 처리
    if (err.response?.statusCode == 401 &&
        err.requestOptions.path != '/members/refresh') {
      final refreshToken = await AuthStorage.getRefreshToken();

      // refreshToken 없으면 바로 로그아웃
      if (refreshToken == null) {
        await _logout();
        return handler.reject(err);
      }

      try {
        // 1. refreshToken으로 새 accessToken 요청
        final response = await dio.post(
          '/members/refresh',
          data: {'refreshToken': refreshToken},
        );

        final newAccessToken = response.data['accessToken'];
        if (newAccessToken == null) {
          // 갱신 실패 시 로그아웃
          await _logout();
          return handler.reject(err);
        }

        // 2. 새 accessToken 저장
        await AuthStorage.saveTokens(newAccessToken, refreshToken);

        // 3. 원래 요청 재시도
        final requestOptions = err.requestOptions
          ..headers['Authorization'] = 'Bearer $newAccessToken';

        final retryResponse = await dio.fetch(requestOptions);
        return handler.resolve(retryResponse);
      } on DioException catch (_) {
        // 갱신 실패 시 로그아웃
        await _logout();
        return handler.reject(err);
      }
    }

    super.onError(err, handler);
  }

  Future<void> _logout() async {
    await AuthStorage.clear();

    // navigatorKey로 SocialPage 이동
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      '/social_page',
      (route) => false,
    );
  }
}
