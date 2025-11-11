import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
import '../../../_core/utils/my_http.dart';
import '../record_service/record_service.dart';
import '../repository/record_repository.dart';
import '../models/record_item.dart';
import '../models/record_filter.dart';

final recordServiceProvider = Provider((ref) {
  return RecordService(dio: dio);
});

final recordRepositoryProvider = Provider((ref) {
  final recordService = ref.watch(recordServiceProvider);
  return RecordRepository(recordService: recordService);
});

final currentPageProvider = StateProvider<int>((ref) => 0);

final searchKeywordProvider = StateProvider<String>((ref) => '');

final recordFilterProvider = StateProvider<RecordFilter>((ref) {
  return const RecordFilter.initial();
});

final recordListProvider = FutureProvider.family<List<RecordItem>, int>(
  (ref, page) async {
    final repository = ref.watch(recordRepositoryProvider);
    final filter = ref.watch(recordFilterProvider);

    return repository.getRecordList(
      page: page,
      size: 10,
      filter: filter,
    );
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
    return UpdateRecordNotifier(repository, ref);
  },
);

final saveRecordProvider =
    StateNotifierProvider<SaveRecordNotifier, AsyncValue<RecordItem?>>(
  (ref) {
    final repository = ref.watch(recordRepositoryProvider);
    return SaveRecordNotifier(repository, ref);
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
  final Ref _ref;

  UpdateRecordNotifier(this._repository, this._ref)
      : super(const AsyncValue.data(null));

  Future<void> updateRecord({
    required int id,
    required String title,
    required String content,
    List<File>? imageFiles,
    List<File>? audioFiles,
    List<File>? videoFiles,
    List<int>? deletedImageIds,
  }) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(
      () async {
        await _repository.updateRecord(
          id: id,
          title: title,
          content: content,
          imageFiles: imageFiles,
          audioFiles: audioFiles,
          videoFiles: videoFiles,
          deletedImageIds: deletedImageIds,
        );

        _ref.invalidate(recordDetailProvider(id));
        _ref.invalidate(recordListProvider(0));
      },
    );
  }
}

class SaveRecordNotifier extends StateNotifier<AsyncValue<RecordItem?>> {
  final RecordRepository _repository;
  final Ref _ref;

  SaveRecordNotifier(this._repository, this._ref)
      : super(const AsyncValue.data(null));

  Future<void> saveRecord({
    required String title,
    required String content,
    List<File>? imageFiles,
    List<File>? audioFiles,
    List<File>? videoFiles,
  }) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(
      () async {
        final savedRecord = await _repository.saveRecord(
          title: title,
          content: content,
          imageFiles: imageFiles,
          audioFiles: audioFiles,
          videoFiles: videoFiles,
        );

        _ref.read(currentPageProvider.notifier).state = 0;
        _ref.invalidate(recordListProvider(0));

        return savedRecord;
      },
    );
  }
}
