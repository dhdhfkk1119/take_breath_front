import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;


  ApiService({required Dio dio}) : _dio = dio;

  // GET 요청
  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );

      if (response.statusCode == 200 && response.data != null) {
        return response.data['response'];
      } else {
        throw Exception("API 응답 오류: ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    } catch (e) {
      throw Exception("예상치 못한 오류: $e");
    }
  }


  // POST 요청
  Future<dynamic> post(String path, dynamic data) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
      );
      if (response.statusCode == 200 && response.data != null) {
        return response.data['response'];
      } else {
        throw Exception("API 응답 오류: ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    } catch (e) {
      throw Exception("예상치 못한 오류: $e");
    }
  }


  // 공통 Dio 에러 핸들링 메서드
  String _handleDioError(DioException e) {
    if (e.response != null) {
      final errorMessage = e.response!.data?['message'] ??
          '서버 응답 오류 (상태: ${e.response!.statusCode})';
      return errorMessage;
    } else {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          return "네트워크 연결 시간이 초과되었습니다.";
        case DioExceptionType.connectionError:
          return "서버가 연결되어 있지 않거나 네트워크 오류가 발생했습니다.";
        default:
          return "API 호출 중 알 수 없는 오류가 발생했습니다.";
      }
    }
  }
}