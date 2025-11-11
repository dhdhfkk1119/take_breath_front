import '../models/record_item.dart';
import '../models/record_filter.dart'; // ✅ 추가
import '../record_service/record_service.dart';
import 'dart:io';
import 'dart:typed_data';

class RecordRepository {
  final RecordService recordService;

  RecordRepository({required this.recordService});

  // ✅ 필터 파라미터 추가
  Future<List<RecordItem>> getRecordList({
    required int page,
    required int size,
    RecordFilter? filter, // ✅ 추가
  }) async {
    final response = await recordService.getRecordList(
      page: page,
      size: size,
      hasImage: filter?.hasImage, // ✅ 추가
      hasAudio: filter?.hasAudio, // ✅ 추가
      hasVideo: filter?.hasVideo, // ✅ 추가
    );

    final List<dynamic> content = response['response']?['content'] ?? [];

    final List<RecordItem> records = content.map((item) {
      final String? rawThumbnailUrl = item['thumbnailUrl'];
      final String? thumbnailUrl =
          rawThumbnailUrl != null ? _convertToValidUrl(rawThumbnailUrl) : null;

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
      final String? rawThumbnailUrl = item['thumbnailUrl'];
      final String? thumbnailUrl =
          rawThumbnailUrl != null ? _convertToValidUrl(rawThumbnailUrl) : null;

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
    if (filePath.isEmpty) {
      return '';
    }

    if (filePath.startsWith('http://') || filePath.startsWith('https://')) {
      return filePath;
    }

    if (filePath.startsWith('/uploads/')) {
      return 'http://192.168.0.156:8080$filePath';
    }

    if (filePath.startsWith('records/')) {
      return 'http://192.168.0.156:8080/uploads/$filePath';
    }

    if (filePath.contains('uploads')) {
      final parts = filePath.split('uploads');
      if (parts.length > 1) {
        String imageUrl = 'http://192.168.0.156:8080/uploads${parts[1]}';
        return imageUrl.replaceAll('\\', '/');
      }
    }

    return '';
  }
}
