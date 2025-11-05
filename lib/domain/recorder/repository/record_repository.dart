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
      return RecordItem(
        id: item['id'],
        title: item['title'] ?? '',
        content: item['content'] ?? '',
        date: item['recordDate'] ?? '',
        imageCount: item['imageFileCount'] ?? 0,
        audioCount: item['audioFileCount'] ?? 0,
      );
    }).toList();

    return records;
  }

  /// 기록 검색
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
      return RecordItem(
        id: item['id'],
        title: item['title'] ?? '',
        content: item['content'] ?? '',
        date: item['recordDate'] ?? '',
        imageCount: item['imageFileCount'] ?? 0,
        audioCount: item['audioFileCount'] ?? 0,
      );
    }).toList();

    return records;
  }

  Future<Map<String, dynamic>> getRecord({required int id}) async {
    final response = await recordService.getRecord(id: id);

    // imageFiles 변환
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

    // audioFiles 변환
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

    // videoFiles 변환
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

  /// 기록 수정 (파일 포함)
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

  /// 기록 삭제
  Future<void> deleteRecord({required int id}) async {
    await recordService.deleteRecord(id: id);
  }

  /// ⭐ PDF 다운로드
  Future<Uint8List> downloadRecordPdf({required int id}) async {
    return await recordService.downloadRecordPdf(id: id);
  }

  /// 파일 경로를 유효한 네트워크 URL로 변환
  String _convertToValidUrl(String filePath) {
    if (filePath.isEmpty || filePath == 'url1') {
      return 'http://10.0.2.2:8080/uploads/records/images/sample_001.png';
    }

    if (filePath.startsWith('http')) {
      return filePath;
    }

    // record → records 변환
    String convertedPath =
        filePath.replaceAll('/uploads/record/', '/uploads/records/');

    if (convertedPath.startsWith('/uploads/')) {
      return 'http://10.0.2.2:8080$convertedPath';
    }

    if (convertedPath.contains('uploads')) {
      final parts = convertedPath.split('uploads');
      if (parts.length > 1) {
        String imageUrl = 'http://10.0.2.2:8080/uploads${parts[1]}';
        imageUrl = imageUrl.replaceAll('\\', '/');
        return imageUrl;
      }
    }

    return 'http://10.0.2.2:8080/uploads/records/images/sample_001.png';
  }
}
