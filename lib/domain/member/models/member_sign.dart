import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_sign.freezed.dart';
part 'member_sign.g.dart';

enum Role {
  USER,
  COUNSELOR,
  ADMIN,
}

@freezed
class MemberSign with _$MemberSign {
  const factory MemberSign({
    required String email,
    required String password,
    required String confirmPassword,
    required String name,
    required String phone,
    required String address,
    @Default(Role.USER) Role role,
  }) = _MemberSign;

  factory MemberSign.fromJson(Map<String, dynamic> json) =>
      _$MemberSignFromJson(json);
}
