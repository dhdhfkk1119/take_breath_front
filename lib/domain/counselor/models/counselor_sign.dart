import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:take_breath/domain/counselor/models/counselor_license_request.dart';
import 'package:take_breath/domain/member/models/terms_request.dart';

part 'counselor_sign.freezed.dart';
part 'counselor_sign.g.dart';

@freezed
class CounselorSign with _$CounselorSign {
  const factory CounselorSign({
    required String email,
    required String password,
    required String confirmPassword,
    required String name,
    required String phone,
    required String address,
    @Default([]) List<TermsRequest> agreements,
    required String specialty,
    required String introduction,
    required String gender,
    required String profileImage,
    required String hashtags,
    required int price,
    @Default([]) List<CounselorLicenseRequest> licenses,
  }) = _CounselorSign;

  factory CounselorSign.fromJson(Map<String, dynamic> json) =>
      _$CounselorSignFromJson(json);
}
