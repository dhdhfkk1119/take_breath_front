import 'package:freezed_annotation/freezed_annotation.dart';

part 'community_comment_request.freezed.dart';

@freezed
class CommunityCommentRequest with _$CommunityCommentRequest {
  const factory CommunityCommentRequest({
    required String content,
  }) = _CommunityCommentRequest;
}
