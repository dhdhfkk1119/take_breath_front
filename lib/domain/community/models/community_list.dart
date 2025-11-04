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
    @Default("") String thumbnail,
    @Default(false) bool liked,
    @Default(false) bool modified,
    @Default(0) int likeCount,
    @Default(0) int commentCount,
    @Default(0) int viewCount,
    required String createdAt,
  }) = _CommunityList;

  factory CommunityList.fromJson(Map<String, dynamic> json) =>
      _$CommunityListFromJson(json);
}
