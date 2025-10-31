// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counselor_sign.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CounselorSignImpl _$$CounselorSignImplFromJson(Map<String, dynamic> json) =>
    _$CounselorSignImpl(
      email: json['email'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      agreements: (json['agreements'] as List<dynamic>?)
              ?.map((e) => TermsRequest.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      specialty: json['specialty'] as String,
      introduction: json['introduction'] as String,
      gender: json['gender'] as String,
      profileImage: json['profileImage'] as String,
      hashtags: json['hashtags'] as String,
      price: (json['price'] as num).toInt(),
      licenses: (json['licenses'] as List<dynamic>?)
              ?.map((e) =>
                  CounselorLicenseRequest.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CounselorSignImplToJson(_$CounselorSignImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'agreements': instance.agreements,
      'specialty': instance.specialty,
      'introduction': instance.introduction,
      'gender': instance.gender,
      'profileImage': instance.profileImage,
      'hashtags': instance.hashtags,
      'price': instance.price,
      'licenses': instance.licenses,
    };
