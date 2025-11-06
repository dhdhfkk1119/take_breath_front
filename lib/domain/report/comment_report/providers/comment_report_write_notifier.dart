import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/utils/base_state.dart';
import 'package:take_breath/domain/report/comment_report/repositories/comment_report_repository.dart';

final commentReportProvider =
    NotifierProvider<CommentReportNotifier, BaseState<void>>(
  () => CommentReportNotifier(),
);

class CommentReportNotifier extends Notifier<BaseState<void>> {
  final CommentReportRepository reportRepository = CommentReportRepository();

  @override
  BaseState<void> build() {
    return BaseState<void>.initial();
  }

  Future<void> reportComment(int commentId, String reason) async {
    state = state.loading();
    try {
      await reportRepository.reportComment(commentId, reason);
    } catch (e) {
      state = state.failure(e.toString());
    }
  }
}
