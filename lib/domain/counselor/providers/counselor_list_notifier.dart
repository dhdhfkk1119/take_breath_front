import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/utils/base_state.dart';
import 'package:take_breath/_core/utils/page_request.dart';
import 'package:take_breath/domain/counselor/models/counselor_response.dart';
import 'package:take_breath/domain/counselor/providers/counselor_repository_provider.dart';
import 'package:take_breath/domain/counselor/repositories/counselor_repository.dart';

final counselorListProvider = NotifierProvider<CounselorListNotifier,
    BaseState<PageResponse<CounselorResponse>>>(
  () => CounselorListNotifier(),
);

class CounselorListNotifier
    extends Notifier<BaseState<PageResponse<CounselorResponse>>> {
  late final CounselorRepository counselorRepository;

  int currentPage = 0;
  final int pageSize = 5;

  @override
  BaseState<PageResponse<CounselorResponse>> build() {
    counselorRepository = ref.read(counselorRepositoryProvider);
    return BaseState<PageResponse<CounselorResponse>>.initial();
  }

  // 첫 페이지 로드
  Future<void> fetchFirstPage() async {
    state = state.loading();
    try {
      final pageData =
          await counselorRepository.findAll(page: 0, size: pageSize);
      currentPage = pageData.pageNumber;

      state = state.success(pageData);
    } catch (e) {
      state = state.failure(e.toString());
    }
  }

  // 다음 페이지 로드 (무한 스크롤)
  Future<void> fetchNextPage() async {
    if (state.data == null || state.data!.isLast) return;

    try {
      final pageData = await counselorRepository.findAll(
        page: currentPage + 1,
        size: pageSize,
      );
      currentPage = pageData.pageNumber;

      // 기존 content와 새 content 합치기
      final combinedContent = [
        ...?state.data?.content, // null-safe
        ...pageData.content,
      ];

      state = state.success(
        PageResponse<CounselorResponse>(
          content: combinedContent,
          pageNumber: pageData.pageNumber,
          pageSize: pageData.pageSize,
          totalPages: pageData.totalPages,
          totalElements: pageData.totalElements,
          isFirst: pageData.isFirst,
          isLast: pageData.isLast,
        ),
      );
    } catch (e) {
      state = state.failure(e.toString());
    }
  }
}
