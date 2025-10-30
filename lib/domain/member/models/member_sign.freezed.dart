// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_sign.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MemberSign _$MemberSignFromJson(Map<String, dynamic> json) {
  return _MemberSign.fromJson(json);
}

/// @nodoc
mixin _$MemberSign {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  Role get role => throw _privateConstructorUsedError;

  /// Serializes this MemberSign to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MemberSign
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MemberSignCopyWith<MemberSign> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberSignCopyWith<$Res> {
  factory $MemberSignCopyWith(
          MemberSign value, $Res Function(MemberSign) then) =
      _$MemberSignCopyWithImpl<$Res, MemberSign>;
  @useResult
  $Res call(
      {String email,
      String password,
      String confirmPassword,
      String name,
      String phone,
      String address,
      Role role});
}

/// @nodoc
class _$MemberSignCopyWithImpl<$Res, $Val extends MemberSign>
    implements $MemberSignCopyWith<$Res> {
  _$MemberSignCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MemberSign
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? name = null,
    Object? phone = null,
    Object? address = null,
    Object? role = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemberSignImplCopyWith<$Res>
    implements $MemberSignCopyWith<$Res> {
  factory _$$MemberSignImplCopyWith(
          _$MemberSignImpl value, $Res Function(_$MemberSignImpl) then) =
      __$$MemberSignImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String password,
      String confirmPassword,
      String name,
      String phone,
      String address,
      Role role});
}

/// @nodoc
class __$$MemberSignImplCopyWithImpl<$Res>
    extends _$MemberSignCopyWithImpl<$Res, _$MemberSignImpl>
    implements _$$MemberSignImplCopyWith<$Res> {
  __$$MemberSignImplCopyWithImpl(
      _$MemberSignImpl _value, $Res Function(_$MemberSignImpl) _then)
      : super(_value, _then);

  /// Create a copy of MemberSign
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? name = null,
    Object? phone = null,
    Object? address = null,
    Object? role = null,
  }) {
    return _then(_$MemberSignImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MemberSignImpl implements _MemberSign {
  const _$MemberSignImpl(
      {required this.email,
      required this.password,
      required this.confirmPassword,
      required this.name,
      required this.phone,
      required this.address,
      this.role = Role.USER});

  factory _$MemberSignImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemberSignImplFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  final String confirmPassword;
  @override
  final String name;
  @override
  final String phone;
  @override
  final String address;
  @override
  @JsonKey()
  final Role role;

  @override
  String toString() {
    return 'MemberSign(email: $email, password: $password, confirmPassword: $confirmPassword, name: $name, phone: $phone, address: $address, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberSignImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password, confirmPassword,
      name, phone, address, role);

  /// Create a copy of MemberSign
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberSignImplCopyWith<_$MemberSignImpl> get copyWith =>
      __$$MemberSignImplCopyWithImpl<_$MemberSignImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemberSignImplToJson(
      this,
    );
  }
}

abstract class _MemberSign implements MemberSign {
  const factory _MemberSign(
      {required final String email,
      required final String password,
      required final String confirmPassword,
      required final String name,
      required final String phone,
      required final String address,
      final Role role}) = _$MemberSignImpl;

  factory _MemberSign.fromJson(Map<String, dynamic> json) =
      _$MemberSignImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  String get confirmPassword;
  @override
  String get name;
  @override
  String get phone;
  @override
  String get address;
  @override
  Role get role;

  /// Create a copy of MemberSign
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemberSignImplCopyWith<_$MemberSignImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
