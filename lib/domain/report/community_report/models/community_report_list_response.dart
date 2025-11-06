import 'package:freezed_annotation/freezed_annotation.dart';

import 'community_report_response.dart';

part 'community_report_list_response.freezed.dart';
part 'community_report_list_response.g.dart';

@freezed
class CommunityReportListResponse with _$CommunityReportListResponse {
  const factory CommunityReportListResponse({
    required int id,
    required int reporterId,
    required String reporterName,
    required int postId,
    required String postTitle,
    required String reason,
    @Default(CommunityReportStatus.PENDING) CommunityReportStatus status,
    required String createdAt,
  }) = _CommunityReportListResponse;

  factory CommunityReportListResponse.fromJson(Map<String, dynamic> json) =>
      _$CommunityReportListResponseFromJson(json);
}
