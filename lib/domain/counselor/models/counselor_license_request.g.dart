// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counselor_license_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CounselorLicenseRequestImpl _$$CounselorLicenseRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CounselorLicenseRequestImpl(
      id: (json['id'] as num).toInt(),
      licenseName: json['licenseName'] as String,
      licenseNumber: json['licenseNumber'] as String,
      licenseRegiNumber: json['licenseRegiNumber'] as String,
      licenseImage: json['licenseImage'] as String,
    );

Map<String, dynamic> _$$CounselorLicenseRequestImplToJson(
        _$CounselorLicenseRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'licenseName': instance.licenseName,
      'licenseNumber': instance.licenseNumber,
      'licenseRegiNumber': instance.licenseRegiNumber,
      'licenseImage': instance.licenseImage,
    };
