import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
import '../../../_core/utils/my_http.dart';
import '../record_service/record_service.dart';
import '../repository/record_repository.dart';
import '../models/record_item.dart';

final recordServiceProvider = Provider((ref) {
  return RecordService(dio: dio);
});

final recordRepositoryProvider = Provider((ref) {
  final recordService = ref.watch(recordServiceProvider);
  return RecordRepository(recordService: recordService);
});

final currentPageProvider = StateProvider<int>((ref) => 0);

final searchKeywordProvider = StateProvider<String>((ref) => '');

final recordListProvider = FutureProvider.family<List<RecordItem>, int>(
  (ref, page) async {
    final repository = ref.watch(recordRepositoryProvider);
    return repository.getRecordList(page: page, size: 10);
  },
);

final searchRecordsProvider = FutureProvider.family<List<RecordItem>, String>(
  (ref, keyword) async {
    final repository = ref.watch(recordRepositoryProvider);
    if (keyword.isEmpty) {
      return [];
    }
    return repository.searchRecords(keyword: keyword, page: 0, size: 10);
  },
);

final recordDetailProvider = FutureProvider.family<Map<String, dynamic>, int>(
  (ref, id) async {
    final repository = ref.watch(recordRepositoryProvider);
    return repository.getRecord(id: id);
  },
);

final deleteRecordProvider =
    StateNotifierProvider<DeleteRecordNotifier, AsyncValue<void>>(
  (ref) {
    final repository = ref.watch(recordRepositoryProvider);
    return DeleteRecordNotifier(repository);
  },
);

final updateRecordProvider =
    StateNotifierProvider<UpdateRecordNotifier, AsyncValue<void>>(
  (ref) {
    final repository = ref.watch(recordRepositoryProvider);
    return UpdateRecordNotifier(repository);
  },
);

class DeleteRecordNotifier extends StateNotifier<AsyncValue<void>> {
  final RecordRepository _repository;

  DeleteRecordNotifier(this._repository) : super(const AsyncValue.data(null));

  Future<void> deleteRecord(int id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _repository.deleteRecord(id: id));
  }
}

class UpdateRecordNotifier extends StateNotifier<AsyncValue<void>> {
  final RecordRepository _repository;

  UpdateRecordNotifier(this._repository) : super(const AsyncValue.data(null));

  Future<void> updateRecord({
    required int id,
    required String title,
    required String content,
    List<File>? imageFiles,
    List<File>? audioFiles,
    List<File>? videoFiles,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => _repository.updateRecord(
        id: id,
        title: title,
        content: content,
        imageFiles: imageFiles,
        audioFiles: audioFiles,
        videoFiles: videoFiles,
      ),
    );
  }
}
