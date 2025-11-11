import 'package:freezed_annotation/freezed_annotation.dart';

import 'admin_comment.dart';
import 'community_report_response.dart';

part 'community_report_detail.freezed.dart';
part 'community_report_detail.g.dart';

@freezed
class CommunityReportDetail with _$CommunityReportDetail {
  const factory CommunityReportDetail({
    required int id,
    required int reporterId,
    required String reporterName,
    required int postId,
    required String postTitle,
    required String postContent,
    required String reason,
    @Default(CommunityReportStatus.PENDING) CommunityReportStatus status,
    required String createdAt,
    @Default([]) List<AdminComment> adminComments,
  }) = _CommentReportDetailDTO;

  factory CommunityReportDetail.fromJson(Map<String, dynamic> json) =>
      _$CommunityReportDetailFromJson(json);
}
