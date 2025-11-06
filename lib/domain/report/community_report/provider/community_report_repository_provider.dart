import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/report/community_report/repositories/community_report_repository.dart';

final communityReportRepositoryProvider =
    Provider<CommunityReportRepository>((ref) {
  return CommunityReportRepository();
});
