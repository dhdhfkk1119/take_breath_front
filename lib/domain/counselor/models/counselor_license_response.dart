import 'package:freezed_annotation/freezed_annotation.dart';

part 'counselor_license_response.freezed.dart';
part 'counselor_license_response.g.dart';

@freezed
class CounselorLicenseResponse with _$CounselorLicenseResponse {
  const factory CounselorLicenseResponse({
    required String licenseName,
    required String licenseNumber,
    required String licenseRegistrationNumber,
    required String licenseImage,
  }) = _CounselorLicenseResponse;

  factory CounselorLicenseResponse.fromJson(Map<String, dynamic> json) =>
      _$CounselorLicenseResponseFromJson(json);
}
