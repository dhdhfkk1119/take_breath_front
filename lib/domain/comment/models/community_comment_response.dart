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
    @Default("") String updatedAt,
    @Default(false) bool modified,
    @Default(false) bool deleted,
  }) = _CommunityCommentResponse;

  factory CommunityCommentResponse.fromJson(Map<String, dynamic> json) =>
      _$CommunityCommentResponseFromJson(json);
}
