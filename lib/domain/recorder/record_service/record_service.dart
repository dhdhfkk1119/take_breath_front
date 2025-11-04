import 'package:dio/dio.dart';

class RecordService {
  final Dio _dio;

  RecordService({required Dio dio}) : _dio = dio;

  Future<Map<String, dynamic>> getRecordList({
    required int page,
    required int size,
  }) async {
    try {
      final response = await _dio.get(
        '/records',
        queryParameters: {
          'page': page,
          'size': size,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data['response'];

        return {
          'content': (data['content'] ?? []) as List<dynamic>,
          'totalPages': data['totalPages'] ?? 0,
          'totalElements': data['totalElements'] ?? 0,
          'first': data['first'] ?? true,
          'last': data['last'] ?? false,
          'numberOfElements': data['pageSize'] ?? 0,
        };
      } else {
        throw Exception('기록 목록 조회 실패: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('네트워크 오류: ${e.message}');
    } catch (e) {
      throw Exception('예상 치 못한 오류: $e');
    }
  }

  Future<Map<String, dynamic>> getRecord({required int id}) async {
    try {
      final response = await _dio.get('/records/$id');

      if (response.statusCode == 200) {
        return response.data['response'] ?? {};
      } else {
        throw Exception('기록 상세 조회 실패: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('네트워크 오류: ${e.message}');
    } catch (e) {
      throw Exception('예상 치 못한 오류: $e');
    }
  }
}
