import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/utils/base_state.dart';
import 'package:take_breath/domain/counselor/models/counselor_response.dart';

import '../../../_core/utils/api_service.dart';
import '../../../_core/utils/my_http.dart';
import '../repositories/counselor_repository.dart';

final likedCounselorsProvider =
NotifierProvider<LikedCounselorsNotifier, BaseState<List<CounselorResponse>>>(
      () => LikedCounselorsNotifier(),
);

class LikedCounselorsNotifier extends Notifier<BaseState<List<CounselorResponse>>> {
  int _currentPage = 0;
  bool _isLastPage = false;

  final CounselorRepository _repository = CounselorRepository(apiService: ApiService(dio: dio));

  @override
  BaseState<List<CounselorResponse>> build() {
    return BaseState<List<CounselorResponse>>(
      isLoading: false,
      error: null,
      data: [],
    );
  }

  // 첫 페이지 로드 및 새로고침
  Future<void> fetchList() async {
    if (state.isLoading) return;

    _currentPage = 0;
    _isLastPage = false;

    state = state.loading();

    try {
      final List<CounselorResponse> newCounselors =
      await _repository.getLikedCounselors(page: _currentPage, size: 10);

      if (newCounselors.length < 10) {
        _isLastPage = true;
      }

      state = state.success(newCounselors);
    } catch (e) {
      state = state.failure("찜 목록을 가져오는 데 실패했습니다: ${e.toString()}");
    }
  }

  // 다음 페이지 로드 (무한 스크롤)
  Future<void> loadMore() async {
    if (state.isLoading || _isLastPage) return;

    state = state.copyWith(isLoading: true);

    _currentPage++;

    try {
      final List<CounselorResponse> moreCounselors =
      await _repository.getLikedCounselors(page: _currentPage, size: 10);

      if (moreCounselors.length < 10) {
        _isLastPage = true;
      }

      final List<CounselorResponse> combinedList = [
        ...state.data!,
        ...moreCounselors,
      ];

      state = state.success(combinedList);
    } catch (e) {
      _currentPage--;
      state = state.failure("다음 페이지를 로드하는 데 실패했습니다: ${e.toString()}");
    }
  }
}