import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import '../../member/services/auth_interceptor.dart';
import '../record_service/record_service.dart';
import '../repository/record_repository.dart';
import '../models/record_item.dart';

// Dio Provider (전역 Dio 인스턴스)
final dioProvider = Provider((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:8080/api',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  // AuthInterceptor 추가 (토큰 자동 포함)
  dio.interceptors.add(AuthInterceptor());

  return dio;
});

// RecordService Provider
final recordServiceProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);
  return RecordService(dio: dio);
});

// RecordRepository Provider
final recordRepositoryProvider = Provider((ref) {
  final recordService = ref.watch(recordServiceProvider);
  return RecordRepository(recordService: recordService);
});

// 현재 페이지 상태
final currentPageProvider = StateProvider<int>((ref) => 0);

// 검색 키워드 상태
final searchKeywordProvider = StateProvider<String>((ref) => '');

// 기록 목록 조회
final recordListProvider = FutureProvider.family<List<RecordItem>, int>(
  (ref, page) async {
    final repository = ref.watch(recordRepositoryProvider);
    return repository.getRecordList(page: page, size: 10);
  },
);

// 기록 검색
final searchRecordsProvider = FutureProvider.family<List<RecordItem>, String>(
  (ref, keyword) async {
    final repository = ref.watch(recordRepositoryProvider);
    if (keyword.isEmpty) {
      return [];
    }
    return repository.searchRecords(keyword: keyword, page: 0, size: 10);
  },
);

// 기록 상세 조회
final recordDetailProvider = FutureProvider.family<Map<String, dynamic>, int>(
  (ref, id) async {
    final repository = ref.watch(recordRepositoryProvider);
    return repository.getRecord(id: id);
  },
);

// 기록 삭제 (StateNotifier 사용)
final deleteRecordProvider =
    StateNotifierProvider<DeleteRecordNotifier, AsyncValue<void>>(
  (ref) {
    final repository = ref.watch(recordRepositoryProvider);
    return DeleteRecordNotifier(repository);
  },
);

// 기록 수정 (StateNotifier 사용)
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
    List<File>? imageFiles, // ⭐ newImageFiles → imageFiles
    List<File>? audioFiles, // ⭐ newAudioFiles → audioFiles
    List<File>? videoFiles, // ⭐ newVideoFiles → videoFiles
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => _repository.updateRecord(
        id: id,
        title: title,
        content: content,
        imageFiles: imageFiles, // ⭐ 변경
        audioFiles: audioFiles, // ⭐ 변경
        videoFiles: videoFiles, // ⭐ 변경
      ),
    );
  }
}
