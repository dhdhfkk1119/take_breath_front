import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/utils/base_state.dart';
import 'package:take_breath/domain/report/comment_report/models/comment_report_response.dart';
import 'package:take_breath/domain/report/comment_report/repositories/comment_report_repository.dart';

final communityReportDetailProvider = NotifierProvider<
    CommentReportDetailNotifier, BaseState<CommentReportDetailDTO>>(
  () => CommentReportDetailNotifier(),
);

class CommentReportDetailNotifier
    extends Notifier<BaseState<CommentReportDetailDTO>> {
  final CommentReportRepository communityReportRepository =
      CommentReportRepository();

  @override
  BaseState<CommentReportDetailDTO> build() {
    return const BaseState<CommentReportDetailDTO>(
      isLoading: false,
      error: null,
      data: null,
    );
  }

  Future<void> fetchDetail(int reportId) async {
    if (state.isLoading) return;

    state = state.loading();

    try {
      final CommentReportDetailDTO detail =
          await communityReportRepository.getReportDetail(reportId);

      state = state.success(detail);
    } catch (e) {
      state = state.failure("신고 상세 정보를 불러오는데 실패했습니다: ${e.toString()}");
    }
  }
}
