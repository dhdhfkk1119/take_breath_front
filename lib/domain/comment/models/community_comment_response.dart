import 'package:freezed_annotation/freezed_annotation.dart';

part 'community_comment_response.freezed.dart';
part 'community_comment_response.g.dart';

@freezed
class CommunityCommentResponse with _$CommunityCommentResponse {
  const factory CommunityCommentResponse({
    required int id,
    required String content,
    required int memberId,
    required String memberName,
    required String createdAt,
    required String updatedAt,
    required bool deleted,
    required bool modified,
  }) = _CommunityCommentResponse;

  factory CommunityCommentResponse.fromJson(Map<String, dynamic> json) =>
      _$CommunityCommentResponseFromJson(json);
}
