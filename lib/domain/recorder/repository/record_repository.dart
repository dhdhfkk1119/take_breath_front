import '../models/record_item.dart';
import '../record_service/record_service.dart';

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

  Future<Map<String, dynamic>> getRecord({required int id}) async {
    return await recordService.getRecord(id: id);
  }
}
