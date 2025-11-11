import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:typed_data';

class RecordService {
  final Dio dio;

  RecordService({required this.dio});

  //  필터 파라미터 추가
  Future<Map<String, dynamic>> getRecordList({
    required int page,
    required int size,
    bool? hasImage,
    bool? hasAudio,
    bool? hasVideo,
  }) async {
    final queryParameters = {
      'page': page,
      'size': size,
      if (hasImage != null) 'hasImage': hasImage,
      if (hasAudio != null) 'hasAudio': hasAudio,
      if (hasVideo != null) 'hasVideo': hasVideo,
    };

    final response = await dio.get(
      '/records',
      queryParameters: queryParameters,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> searchRecords({
    required String keyword,
    required int page,
    required int size,
  }) async {
    final response = await dio.get(
      '/records/search',
      queryParameters: {
        'keyword': keyword,
        'page': page,
        'size': size,
      },
    );
    return response.data;
  }

  Future<Map<String, dynamic>> getRecord({required int id}) async {
    final response = await dio.get('/records/$id');
    return response.data;
  }

  Future<void> updateRecord({
    required int id,
    required String title,
    required String content,
    List<File>? imageFiles,
    List<File>? audioFiles,
    List<File>? videoFiles,
    List<int>? deletedImageIds,
  }) async {
    final formData = FormData();

    formData.fields.add(MapEntry('title', title));
    formData.fields.add(MapEntry('content', content));

    if (deletedImageIds != null && deletedImageIds.isNotEmpty) {
      for (var id in deletedImageIds) {
        formData.fields.add(MapEntry('deletedImageIds', id.toString()));
      }
    }

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

    await dio.put('/records/$id', data: formData);
  }

  Future<void> deleteRecord({required int id}) async {
    await dio.delete('/records/$id');
  }

  Future<Uint8List> downloadRecordPdf({required int id}) async {
    final response = await dio.get(
      '/records/pdf/$id',
      options: Options(responseType: ResponseType.bytes),
    );
    return Uint8List.fromList(response.data);
  }

  Future<Map<String, dynamic>> saveRecord({
    required String title,
    required String content,
    List<File>? imageFiles,
    List<File>? audioFiles,
    List<File>? videoFiles,
  }) async {
    final formData = FormData();

    formData.fields.add(MapEntry('title', title));
    formData.fields.add(MapEntry('content', content));

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

    final response = await dio.post(
      '/records',
      data: formData,
    );
    return response.data;
  }
}
