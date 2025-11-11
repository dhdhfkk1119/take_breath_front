// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counselor_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CounselorResponseImpl _$$CounselorResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CounselorResponseImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      license: json['license'] as String?,
      specialty: json['specialty'] as String?,
      introduction: json['introduction'] as String?,
      profileImage: json['profileImage'] as String?,
      hashtags: json['hashtags'] as String?,
      gender: json['gender'] as String?,
      price: (json['price'] as num).toInt(),
      likeCount: (json['likeCount'] as num?)?.toInt() ?? 0,
      likedByMe: json['likedByMe'] as bool?,
      licenses: (json['licenses'] as List<dynamic>?)
          ?.map((e) =>
              CounselorLicenseResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CounselorResponseImplToJson(
        _$CounselorResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'license': instance.license,
      'specialty': instance.specialty,
      'introduction': instance.introduction,
      'profileImage': instance.profileImage,
      'hashtags': instance.hashtags,
      'gender': instance.gender,
      'price': instance.price,
      'likeCount': instance.likeCount,
      'likedByMe': instance.likedByMe,
      'licenses': instance.licenses,
    };
