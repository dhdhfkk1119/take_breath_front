// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counselor_license_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CounselorLicenseResponseImpl _$$CounselorLicenseResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CounselorLicenseResponseImpl(
      licenseName: json['licenseName'] as String,
      licenseNumber: json['licenseNumber'] as String,
      licenseRegistrationNumber: json['licenseRegistrationNumber'] as String,
      licenseImage: json['licenseImage'] as String,
    );

Map<String, dynamic> _$$CounselorLicenseResponseImplToJson(
        _$CounselorLicenseResponseImpl instance) =>
    <String, dynamic>{
      'licenseName': instance.licenseName,
      'licenseNumber': instance.licenseNumber,
      'licenseRegistrationNumber': instance.licenseRegistrationNumber,
      'licenseImage': instance.licenseImage,
    };
