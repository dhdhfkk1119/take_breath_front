import '../models/record_item.dart';
import '../record_service/record_service.dart';
import 'dart:io';
import 'dart:typed_data';

class RecordRepository {
  final RecordService recordService;

  RecordRepository({required this.recordService});

  Future<List<RecordItem>> getRecordList({
    required int page,
    required int size,
  }) async {
    final response = await recordService.getRecordList(
      page: page,
      size: size,
    );

    print('========== RecordRepository.getRecordList ==========');
    print('Full Response: $response');
    print('Response keys: ${response.keys.toList()}');
    print('Response type: ${response.runtimeType}');
    print('====================================================');

    final List<dynamic> content = response['response']?['content'] ?? [];

    print(' Content length: ${content.length}');

    final List<RecordItem> records = content.map((item) {
      String? thumbnailUrl;
      if (item['imageFiles'] != null &&
          (item['imageFiles'] as List).isNotEmpty) {
        try {
          final firstImage = (item['imageFiles'] as List)[0] as Map;
          final filePath = (firstImage['filePath'] ?? '') as String;
          if (filePath.isNotEmpty) {
            thumbnailUrl = _convertToValidUrl(filePath);
          }
        } catch (e) {
          // URL 변환 오류 무시
        }
      }

      return RecordItem(
        id: item['id'],
        title: item['title'] ?? '',
        content: item['content'] ?? '',
        date: item['recordDate'] ?? '',
        imageCount: item['imageFileCount'] ?? 0,
        audioCount: item['audioFileCount'] ?? 0,
        thumbnailUrl: thumbnailUrl,
      );
    }).toList();

    return records;
  }

  Future<List<RecordItem>> searchRecords({
    required String keyword,
    required int page,
    required int size,
  }) async {
    final response = await recordService.searchRecords(
      keyword: keyword,
      page: page,
      size: size,
    );

    final List<dynamic> content = response['response']?['content'] ?? [];

    final List<RecordItem> records = content.map((item) {
      String? thumbnailUrl;
      if (item['imageFiles'] != null &&
          (item['imageFiles'] as List).isNotEmpty) {
        try {
          final firstImage = (item['imageFiles'] as List)[0] as Map;
          final filePath = (firstImage['filePath'] ?? '') as String;
          if (filePath.isNotEmpty) {
            thumbnailUrl = _convertToValidUrl(filePath);
          }
        } catch (e) {
          // URL 변환 오류 무시
        }
      }

      return RecordItem(
        id: item['id'],
        title: item['title'] ?? '',
        content: item['content'] ?? '',
        date: item['recordDate'] ?? '',
        imageCount: item['imageFileCount'] ?? 0,
        audioCount: item['audioFileCount'] ?? 0,
        thumbnailUrl: thumbnailUrl,
      );
    }).toList();

    return records;
  }

  Future<Map<String, dynamic>> getRecord({required int id}) async {
    final response = await recordService.getRecord(id: id);

    final recordData = response['response'] ?? response;

    if (recordData['imageFiles'] != null) {
      final imageFiles = recordData['imageFiles'] as List<dynamic>;
      recordData['imageFiles'] = imageFiles.map((file) {
        final filePath = file['filePath'] as String? ?? '';
        String imageUrl = _convertToValidUrl(filePath);
        return {
          ...file,
          'filePath': imageUrl,
        };
      }).toList();
    }

    if (recordData['audioFiles'] != null) {
      final audioFiles = recordData['audioFiles'] as List<dynamic>;
      recordData['audioFiles'] = audioFiles.map((file) {
        final filePath = file['filePath'] as String? ?? '';
        String audioUrl = _convertToValidUrl(filePath);
        return {
          ...file,
          'filePath': audioUrl,
        };
      }).toList();
    }

    if (recordData['videoFiles'] != null) {
      final videoFiles = recordData['videoFiles'] as List<dynamic>;
      recordData['videoFiles'] = videoFiles.map((file) {
        final filePath = file['filePath'] as String? ?? '';
        String videoUrl = _convertToValidUrl(filePath);
        return {
          ...file,
          'filePath': videoUrl,
        };
      }).toList();
    }

    return recordData;
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
    await recordService.updateRecord(
      id: id,
      title: title,
      content: content,
      imageFiles: imageFiles,
      audioFiles: audioFiles,
      videoFiles: videoFiles,
      deletedImageIds: deletedImageIds,
    );
  }

  Future<void> deleteRecord({required int id}) async {
    await recordService.deleteRecord(id: id);
  }

  Future<Uint8List> downloadRecordPdf({required int id}) async {
    return await recordService.downloadRecordPdf(id: id);
  }

  String _convertToValidUrl(String filePath) {
    print('🔍 Converting filePath: $filePath');

    if (filePath.isEmpty || filePath == 'url1') {
      return 'http://192.168.0.156:8080/uploads/records/images/sample_001.png';
    }

    if (filePath.startsWith('http')) {
      return filePath;
    }

    if (filePath.startsWith('records/')) {
      final url = 'http://192.168.0.156:8080/uploads/$filePath';
      print('Converted to: $url');
      return url;
    }

    String convertedPath =
        filePath.replaceAll('/uploads/record/', '/uploads/records/');

    if (convertedPath.startsWith('/uploads/')) {
      final url = 'http://192.168.0.156:8080$convertedPath';
      print('Converted to: $url');
      return url;
    }

    if (convertedPath.contains('uploads')) {
      final parts = convertedPath.split('uploads');
      if (parts.length > 1) {
        String imageUrl = 'http://192.168.0.156:8080/uploads${parts[1]}';
        imageUrl = imageUrl.replaceAll('\\', '/');
        print('Converted to: $imageUrl');
        return imageUrl;
      }
    }

    print('Using default sample image');
    return 'http://192.168.0.156:8080/uploads/records/images/sample_001.png';
  }
}
