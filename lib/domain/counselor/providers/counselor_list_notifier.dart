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
      final PageResponse<CounselorResponse> pageData =
          await counselorRepository.findAll(page: 0, size: pageSize);
      currentPage = pageData.pageNumber;

      state = state.success(pageData);
    } catch (e) {
      state = state.failure(e.toString());
    }
  }

  // 다음 페이지 로드 (무한 스크롤)
  Future<void> fetchNextPage() async {
    if (state.isLoading) return; // 현재 로딩 중이면 무시
    if (state.data == null || state.data!.isLast) return;

    state = state.loading(); // 로딩 상태 설정
    try {
      final pageData = await counselorRepository.findAll(
        page: currentPage + 1,
        size: pageSize,
      );
      currentPage = pageData.pageNumber;

      final combinedContent = [
        ...?state.data?.content,
        ...pageData.content,
      ];

      state = state.success(
        PageResponse(
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

  Future<void> refreshList() async {
    currentPage = 0;
    await fetchFirstPage();
  }

  Future<void> toggleLike(int counselorId) async {
    try {
      final isLiked = await counselorRepository.toggleLike(counselorId);

      final currentData = state.data;
      if (currentData == null) return;

      final updatedList = currentData.content.map((counselor) {
        if (counselor.id == counselorId) {
          return counselor.copyWith(likedByMe: isLiked);
        }
        return counselor;
      }).toList();

      state = state.success(
        currentData.copyWith(content: updatedList),
      );
    } catch (e) {
      state = state.failure(e.toString());
    }
  }
}
