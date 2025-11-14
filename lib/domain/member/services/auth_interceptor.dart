import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:take_breath/_core/utils/my_http.dart';
import 'package:take_breath/domain/member/services/auth_service.dart';
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
    if (err.response?.statusCode == 401 &&
        err.requestOptions.path != '/members/refresh') {
      final refreshToken = await AuthStorage.getRefreshToken();

      // refreshToken 없으면 바로 로그아웃
      if (refreshToken == null) {
        print('로그: Refresh Token 없음. 로그아웃 호출');
        await logoutAndRedirect();
        return handler.reject(err);
      }

      try {
        final response = await dio.post(
          '/members/refresh',
          data: {'refreshToken': refreshToken},
        );

        final newAccessToken = response.data['accessToken'];
        if (newAccessToken == null) {
          print('로그: 새 Access Token 획득 실패. 로그아웃 호출');

          await logoutAndRedirect();
          return handler.reject(err);
        }

        await AuthStorage.saveTokens(newAccessToken, refreshToken);

        final requestOptions = err.requestOptions
          ..headers['Authorization'] = 'Bearer $newAccessToken';

        final retryResponse = await dio.fetch(requestOptions);
        return handler.resolve(retryResponse);
      } on DioException catch (e) {
        print('로그: 토큰 갱신 API 요청 중 오류 발생: $e. 로그아웃 호출');
        await logoutAndRedirect();
        return handler.reject(err);
      }
    }

    super.onError(err, handler);
  }
}
