import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/utils/base_state.dart';
import 'package:take_breath/domain/report/community_report/models/community_report_detail.dart';
import 'package:take_breath/domain/report/community_report/provider/community_report_repository_provider.dart';
import 'package:take_breath/domain/report/community_report/repositories/community_report_repository.dart';

final communityReportDetailProvider = NotifierProvider<
    CommunityReportDetailNotifier, BaseState<CommunityReportDetail>>(
  () => CommunityReportDetailNotifier(),
);

class CommunityReportDetailNotifier
    extends Notifier<BaseState<CommunityReportDetail>> {
  late final CommunityReportRepository communityReportRepository;

  @override
  BaseState<CommunityReportDetail> build() {
    communityReportRepository = ref.read(communityReportRepositoryProvider);
    return const BaseState<CommunityReportDetail>(
      isLoading: false,
      error: null,
      data: null,
    );
  }

  Future<void> fetchDetail(int reportId) async {
    if (state.isLoading) return;

    state = state.loading();

    try {
      final CommunityReportDetail detail =
          await communityReportRepository.getReportDetail(reportId);

      state = state.success(detail);
    } catch (e) {
      state = state.failure("신고 상세 정보를 불러오는데 실패했습니다: ${e.toString()}");
    }
  }
}
