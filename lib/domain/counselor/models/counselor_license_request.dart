import 'package:freezed_annotation/freezed_annotation.dart';

part 'counselor_license_request.freezed.dart';
part 'counselor_license_request.g.dart';

@freezed
class CounselorLicenseRequest with _$CounselorLicenseRequest {
  const factory CounselorLicenseRequest({
    required int id,
    required String licenseName,
    required String licenseNumber,
    required String licenseRegiNumber,
    required String licenseImage,
  }) = _CounselorLicenseRequest;

  factory CounselorLicenseRequest.fromJson(Map<String, dynamic> json) =>
      _$CounselorLicenseRequestFromJson(json);
}
