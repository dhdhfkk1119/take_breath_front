import 'package:dio/dio.dart';
import 'package:take_breath/domain/member/services/auth_interceptor.dart';

const baseUrl = "http://192.168.0.87:8080/api";
const SocketUrl = "http://10.0.2.2:8080";

final dio = Dio(
  BaseOptions(
    baseUrl: baseUrl,
    contentType: "application/json; charset=utf-8",
    validateStatus: (status) => true, // 모든 상태 코드를 onResponse에서 처리
    listFormat: ListFormat.multi,
  ),
)..interceptors.add(AuthInterceptor());
