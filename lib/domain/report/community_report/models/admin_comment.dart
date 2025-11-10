import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:take_breath/domain/report/community_report/models/community_report_response.dart';

part 'admin_comment.freezed.dart';
part 'admin_comment.g.dart';

@freezed
class AdminComment with _$AdminComment {
  const factory AdminComment({
    required int id,
    required CommunityReportStatus status,
    required int adminId,
    required String adminName,
    required String adminComment,
    required String createdAd,
  }) = _AdminComment;
  factory AdminComment.fromJson(Map<String, dynamic> json) =>
      _$AdminCommentFromJson(json);
}
