import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:take_breath/domain/comment/models/community_comment_response.dart';

part 'community_detail.freezed.dart';
part 'community_detail.g.dart';

@freezed
class CommunityDetail with _$CommunityDetail {
  const factory CommunityDetail({
    required int id,
    required String title,
    required int content,
    required int memberId,
    required String memberName,
    required String categoryName,
    required int categoryId,
    required int likeCount,
    required int viewCount,
    required int commentCount,
    required String createdAt,
    required String updatedAt,
    required bool isModified,
    required bool liked,
    required List<String> imageUrls,
    required List<CommunityCommentResponse> comments,
  }) = _CommunityDetail;

  factory CommunityDetail.fromJson(Map<String, dynamic> json) =>
      _$CommunityDetailFromJson(json);
}
