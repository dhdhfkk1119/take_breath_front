import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:typed_data';

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

  /// 기록 검색
  Future<Map<String, dynamic>> searchRecords({
    required String keyword,
    required int page,
    required int size,
  }) async {
    try {
      final response = await _dio.get(
        '/records/search',
        queryParameters: {
          'keyword': keyword,
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
        throw Exception('검색 실패: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('네트워크 오류: ${e.message}');
    } catch (e) {
      throw Exception('예상 치 못한 오류: $e');
    }
  }

  /// 기록 수정 (파일 포함)
  Future<void> updateRecord({
    required int id,
    required String title,
    required String content,
    List<File>? imageFiles,
    List<File>? audioFiles,
    List<File>? videoFiles,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        'title': title,
        'content': content,
      });

      // 새로운 이미지 파일 추가
      if (imageFiles != null && imageFiles.isNotEmpty) {
        for (var file in imageFiles) {
          formData.files.add(
            MapEntry(
              'imageFiles',
              await MultipartFile.fromFile(
                file.path,
                filename: file.path.split('/').last,
              ),
            ),
          );
        }
      }

      // 새로운 오디오 파일 추가
      if (audioFiles != null && audioFiles.isNotEmpty) {
        for (var file in audioFiles) {
          formData.files.add(
            MapEntry(
              'audioFiles',
              await MultipartFile.fromFile(
                file.path,
                filename: file.path.split('/').last,
              ),
            ),
          );
        }
      }

      // 새로운 비디오 파일 추가
      if (videoFiles != null && videoFiles.isNotEmpty) {
        for (var file in videoFiles) {
          formData.files.add(
            MapEntry(
              'videoFiles',
              await MultipartFile.fromFile(
                file.path,
                filename: file.path.split('/').last,
              ),
            ),
          );
        }
      }

      final response = await _dio.put(
        '/records/$id',
        data: formData,
      );

      if (response.statusCode != 200) {
        throw Exception('기록 수정 실패: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('네트워크 오류: ${e.message}');
    } catch (e) {
      throw Exception('예상 치 못한 오류: $e');
    }
  }

  /// 기록 삭제
  Future<void> deleteRecord({required int id}) async {
    try {
      final response = await _dio.delete('/records/$id');

      if (response.statusCode != 200) {
        throw Exception('기록 삭제 실패: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('네트워크 오류: ${e.message}');
    } catch (e) {
      throw Exception('예상 치 못한 오류: $e');
    }
  }

  /// ⭐ PDF 다운로드
  Future<Uint8List> downloadRecordPdf({required int id}) async {
    try {
      final response = await _dio.get(
        '/records/pdf/$id',
        options: Options(responseType: ResponseType.bytes),
      );

      if (response.statusCode == 200) {
        return Uint8List.fromList(response.data as List<int>);
      } else {
        throw Exception('PDF 다운로드 실패: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('네트워크 오류: ${e.message}');
    } catch (e) {
      throw Exception('예상 치 못한 오류: $e');
    }
  }
}
