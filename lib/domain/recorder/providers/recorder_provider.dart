import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/utils/my_http.dart';

import '../models/record_item.dart';
import '../record_service/record_service.dart';
import '../repository/record_repository.dart';

final recordServiceProvider = Provider<RecordService>((ref) {
  return RecordService(dio: dio);
});

final recordRepositoryProvider = Provider<RecordRepository>((ref) {
  return RecordRepository(recordService: ref.watch(recordServiceProvider));
});

final recordListProvider =
    FutureProvider.family<List<RecordItem>, int>((ref, page) async {
  final recordRepository = ref.watch(recordRepositoryProvider);

  final records = await recordRepository.getRecordList(
    page: page,
    size: 10,
  );

  return records;
});

final currentPageProvider = StateProvider<int>((ref) => 0);

final recordDetailProvider = FutureProvider.family<Map<String, dynamic>, int>(
  (ref, id) async {
    final recordService = ref.watch(recordServiceProvider);
    return recordService.getRecord(id: id);
  },
);
