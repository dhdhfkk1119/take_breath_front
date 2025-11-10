import 'package:freezed_annotation/freezed_annotation.dart';

part 'community_report_request.freezed.dart';

@freezed
class CommunityReportRequest with _$CommunityReportRequest {
  const factory CommunityReportRequest({
    required String reason,
  }) = _CommunityReportRequest;
}
