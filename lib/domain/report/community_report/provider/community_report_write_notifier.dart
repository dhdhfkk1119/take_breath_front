import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/utils/base_state.dart';
import 'package:take_breath/domain/report/community_report/models/community_report_request.dart';
import 'package:take_breath/domain/report/community_report/models/community_report_response.dart';
import 'package:take_breath/domain/report/community_report/repositories/community_report_repository.dart';

final communityReportWriteProvider = NotifierProvider<
    CommunityReportWriteNotifier, BaseState<CommunityReportResponse>>(
  () => CommunityReportWriteNotifier(),
);

class CommunityReportWriteNotifier
    extends Notifier<BaseState<CommunityReportResponse>> {
  final CommunityReportRepository communityReportRepository =
      CommunityReportRepository();

  @override
  BaseState<CommunityReportResponse> build() {
    return const BaseState<CommunityReportResponse>(
      isLoading: false,
      error: null,
      data: null,
    );
  }

  Future<CommunityReportResponse> save(
      CommunityReportRequest request, int postId) async {
    state = state.loading();
    return await communityReportRepository.reportCommunity(request, postId);
  }
}
