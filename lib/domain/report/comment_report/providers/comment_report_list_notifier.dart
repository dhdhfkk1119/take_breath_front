import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/utils/base_state.dart';
import 'package:take_breath/domain/report/comment_report/models/comment_report_response.dart';
import 'package:take_breath/domain/report/comment_report/repositories/comment_report_repository.dart';

final commentReportListProvider = NotifierProvider<CommentReportListNotifier, BaseState<List<CommentReportListDTO>>>(
      () => CommentReportListNotifier(),
);

class CommentReportListNotifier
    extends Notifier<BaseState<List<CommentReportListDTO>>> {
  int _currentPage = 0;
  bool _isLastPage = false;

  final CommentReportRepository commentReportRepository =
      CommentReportRepository();

  @override
  BaseState<List<CommentReportListDTO>> build() {
    return BaseState<List<CommentReportListDTO>>(
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
      final List<CommentReportListDTO> newReports =
          await commentReportRepository.findMyReports(
              page: _currentPage, size: 10);

      if (newReports.length < 10) {
        _isLastPage = true;
      }

      state = state.success(newReports); // 새 데이터를 성공 상태로 저장
    } catch (e) {
      state = state.failure("신고 목록을 가져오는 데 실패했습니다: ${e.toString()}");
    }
  }

  // 다음 페이지 로드 (무한 스크롤)
  Future<void> loadMore() async {
    // 이미 로딩 중이거나 마지막 페이지라면 중복 호출 방지
    if (state.isLoading || _isLastPage) return;

    // 로딩 상태 시작 (기존 데이터는 유지)
    state = state.copyWith(isLoading: true);

    _currentPage++; // 다음 페이지 번호로 증가

    try {
      final List<CommentReportListDTO> moreReports =
          await commentReportRepository.findMyReports(
              page: _currentPage, size: 10);

      // 응답 크기가 요청 크기보다 작으면 마지막 페이지로 간주
      if (moreReports.length < 10) {
        _isLastPage = true;
      }

      // 기존 리스트와 새로 가져온 리스트를 합칩니다.
      final List<CommentReportListDTO> combinedList = [
        ...state.data!,
        ...moreReports,
      ];

      state = state.success(combinedList); // 합쳐진 데이터를 성공 상태로 저장
    } catch (e) {
      // 에러 발생 시 현재 페이지를 되돌리고 실패 상태로 변경
      _currentPage--;
      state = state.failure("다음 페이지를 로드하는 데 실패했습니다: ${e.toString()}");
    }
  }
}
