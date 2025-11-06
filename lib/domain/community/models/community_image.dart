import 'package:freezed_annotation/freezed_annotation.dart';

part 'community_image.freezed.dart';
part 'community_image.g.dart';

@freezed
class CommunityImage with _$CommunityImage {
  const factory CommunityImage({
    required int id,
    required String imageUrl,
  }) = _CommunityImage;

  factory CommunityImage.fromJson(Map<String, dynamic> json) =>
      _$CommunityImageFromJson(json);
}
