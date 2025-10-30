// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_sign.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemberSignImpl _$$MemberSignImplFromJson(Map<String, dynamic> json) =>
    _$MemberSignImpl(
      email: json['email'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      role: $enumDecodeNullable(_$RoleEnumMap, json['role']) ?? Role.USER,
      agreements: (json['agreements'] as List<dynamic>?)
              ?.map((e) => TermsRequest.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MemberSignImplToJson(_$MemberSignImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'role': _$RoleEnumMap[instance.role]!,
      'agreements': instance.agreements,
    };

const _$RoleEnumMap = {
  Role.USER: 'USER',
  Role.COUNSELOR: 'COUNSELOR',
  Role.ADMIN: 'ADMIN',
};
