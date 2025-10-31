import 'package:freezed_annotation/freezed_annotation.dart';

part 'community_list.freezed.dart';
part 'community_list.g.dart';

@freezed
class CommunityList with _$CommunityList {
  const factory CommunityList({
    required int id,
    required String title,
    required int memberId,
    required String memberName,
    required int categoryId,
    required String categoryName,
    required String preview,
    required String thumbnail,
    required int likeCount,
    required int viewCount,
    required int commentCount,
    required String createdAt,
    required bool isModified,
    required bool liked,
  }) = _CommunityList;

  factory CommunityList.fromJson(Map<String, dynamic> json) =>
      _$CommunityListFromJson(json);
}
