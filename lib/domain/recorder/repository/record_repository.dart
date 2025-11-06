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

    final List<dynamic> content = response['content'] ?? [];
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

    final List<dynamic> content = response['content'] ?? [];
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

    if (response['imageFiles'] != null) {
      final imageFiles = response['imageFiles'] as List<dynamic>;
      response['imageFiles'] = imageFiles.map((file) {
        final filePath = file['filePath'] as String? ?? '';
        String imageUrl = _convertToValidUrl(filePath);
        return {
          ...file,
          'filePath': imageUrl,
        };
      }).toList();
    }

    if (response['audioFiles'] != null) {
      final audioFiles = response['audioFiles'] as List<dynamic>;
      response['audioFiles'] = audioFiles.map((file) {
        final filePath = file['filePath'] as String? ?? '';
        String audioUrl = _convertToValidUrl(filePath);
        return {
          ...file,
          'filePath': audioUrl,
        };
      }).toList();
    }

    if (response['videoFiles'] != null) {
      final videoFiles = response['videoFiles'] as List<dynamic>;
      response['videoFiles'] = videoFiles.map((file) {
        final filePath = file['filePath'] as String? ?? '';
        String videoUrl = _convertToValidUrl(filePath);
        return {
          ...file,
          'filePath': videoUrl,
        };
      }).toList();
    }

    return response;
  }

  Future<void> updateRecord({
    required int id,
    required String title,
    required String content,
    List<File>? imageFiles,
    List<File>? audioFiles,
    List<File>? videoFiles,
  }) async {
    await recordService.updateRecord(
      id: id,
      title: title,
      content: content,
      imageFiles: imageFiles,
      audioFiles: audioFiles,
      videoFiles: videoFiles,
    );
  }

  Future<void> deleteRecord({required int id}) async {
    await recordService.deleteRecord(id: id);
  }

  Future<Uint8List> downloadRecordPdf({required int id}) async {
    return await recordService.downloadRecordPdf(id: id);
  }

  String _convertToValidUrl(String filePath) {
    if (filePath.isEmpty || filePath == 'url1') {
      return 'http://192.168.0.156:8080/uploads/records/images/sample_001.png';
    }

    if (filePath.startsWith('http')) {
      return filePath;
    }

    String convertedPath =
        filePath.replaceAll('/uploads/record/', '/uploads/records/');

    if (convertedPath.startsWith('/uploads/')) {
      return 'http://192.168.0.156:8080$convertedPath';
    }

    if (convertedPath.contains('uploads')) {
      final parts = convertedPath.split('uploads');
      if (parts.length > 1) {
        String imageUrl = 'http://192.168.0.156:8080/uploads${parts[1]}';
        imageUrl = imageUrl.replaceAll('\\', '/');
        return imageUrl;
      }
    }

    return 'http://192.168.0.156:8080/uploads/records/images/sample_001.png';
  }
}
