import 'package:freezed_annotation/freezed_annotation.dart';
import 'counselor_license_response.dart';

part 'counselor_response.freezed.dart';
part 'counselor_response.g.dart';

@freezed
class CounselorResponse with _$CounselorResponse {
  const factory CounselorResponse({
    required int id,
    required String name,
    String? license,
    String? specialty,
    String? introduction,
    String? profileImage,
    String? hashtags,
    String? gender,
    required int price,
    @Default(0) int likeCount,
    bool? likedByMe,
    List<CounselorLicenseResponse>? licenses,
  }) = _CounselorResponse;

  factory CounselorResponse.fromJson(Map<String, dynamic> json) =>
      _$CounselorResponseFromJson(json);
}
