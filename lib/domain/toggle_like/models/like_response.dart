import 'package:freezed_annotation/freezed_annotation.dart';

part 'like_response.freezed.dart';
part 'like_response.g.dart';

@freezed
class LikeResponse with _$LikeResponse {
  const factory LikeResponse({
    required bool liked,
    required int likeCount,
  }) = _LikeResponse;
  factory LikeResponse.fromJson(Map<String, dynamic> json) =>
      _$LikeResponseFromJson(json);
}
