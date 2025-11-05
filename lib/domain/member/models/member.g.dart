// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemberImpl _$$MemberImplFromJson(Map<String, dynamic> json) => _$MemberImpl(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String?,
      id: (json['id'] as num).toInt(),
      nickName: json['nickName'] as String,
      email: json['email'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      role: json['role'] as String,
      status: json['status'] as String,
      phone: json['phone'] as String,
      daysLeft: (json['daysLeft'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MemberImplToJson(_$MemberImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'id': instance.id,
      'nickName': instance.nickName,
      'email': instance.email,
      'profileImageUrl': instance.profileImageUrl,
      'role': instance.role,
      'status': instance.status,
      'phone': instance.phone,
      'daysLeft': instance.daysLeft,
    };
