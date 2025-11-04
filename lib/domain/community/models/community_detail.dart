import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:take_breath/domain/comment/models/community_comment_response.dart';

part 'community_detail.freezed.dart';
part 'community_detail.g.dart';

@freezed
class CommunityDetail with _$CommunityDetail {
  const factory CommunityDetail({
    required int id,
    required String title,
    required String content,
    int? memberId, // nullable
    String? memberName, // nullable
    String? categoryName, // nullable
    int? categoryId, // nullable
    @Default(0) int likeCount,
    @Default(0) int viewCount,
    @Default(0) int commentCount,
    required String createdAt,
    required String updatedAt,
    @JsonKey(name: 'modified') required bool isModified,
    @Default(false) bool liked,
    @Default([]) List<String> imageUrls,
    @Default([]) List<CommunityCommentResponse> comments,
  }) = _CommunityDetail;

  factory CommunityDetail.fromJson(Map<String, dynamic> json) =>
      _$CommunityDetailFromJson(json);
}
