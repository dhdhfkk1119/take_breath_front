import 'package:freezed_annotation/freezed_annotation.dart';

part 'community_report_response.freezed.dart';
part 'community_report_response.g.dart';

enum CommunityReportStatus {
  PENDING, // 신고 보류/대기
  REJECTED, // 신고 거부
  APPROVED // 신고 승인
}

@freezed
class CommunityReportResponse with _$CommunityReportResponse {
  const factory CommunityReportResponse({
    required int id,
    required int reporterId,
    required String reporterName,
    required int postId,
    required String reason,
    required String message,
    @Default(CommunityReportStatus.PENDING) CommunityReportStatus status,
    required String createdAt,
  }) = _CommunityReportResponse;

  factory CommunityReportResponse.fromJson(Map<String, dynamic> json) =>
      _$CommunityReportResponseFromJson(json);
}
