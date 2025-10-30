// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'is_email_check.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IsEmailCheck _$IsEmailCheckFromJson(Map<String, dynamic> json) {
  return _IsEmailCheck.fromJson(json);
}

/// @nodoc
mixin _$IsEmailCheck {
  String get message => throw _privateConstructorUsedError;
  bool get check => throw _privateConstructorUsedError;

  /// Serializes this IsEmailCheck to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IsEmailCheck
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IsEmailCheckCopyWith<IsEmailCheck> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IsEmailCheckCopyWith<$Res> {
  factory $IsEmailCheckCopyWith(
          IsEmailCheck value, $Res Function(IsEmailCheck) then) =
      _$IsEmailCheckCopyWithImpl<$Res, IsEmailCheck>;
  @useResult
  $Res call({String message, bool check});
}

/// @nodoc
class _$IsEmailCheckCopyWithImpl<$Res, $Val extends IsEmailCheck>
    implements $IsEmailCheckCopyWith<$Res> {
  _$IsEmailCheckCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IsEmailCheck
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? check = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      check: null == check
          ? _value.check
          : check // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IsEmailCheckImplCopyWith<$Res>
    implements $IsEmailCheckCopyWith<$Res> {
  factory _$$IsEmailCheckImplCopyWith(
          _$IsEmailCheckImpl value, $Res Function(_$IsEmailCheckImpl) then) =
      __$$IsEmailCheckImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, bool check});
}

/// @nodoc
class __$$IsEmailCheckImplCopyWithImpl<$Res>
    extends _$IsEmailCheckCopyWithImpl<$Res, _$IsEmailCheckImpl>
    implements _$$IsEmailCheckImplCopyWith<$Res> {
  __$$IsEmailCheckImplCopyWithImpl(
      _$IsEmailCheckImpl _value, $Res Function(_$IsEmailCheckImpl) _then)
      : super(_value, _then);

  /// Create a copy of IsEmailCheck
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? check = null,
  }) {
    return _then(_$IsEmailCheckImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      check: null == check
          ? _value.check
          : check // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IsEmailCheckImpl implements _IsEmailCheck {
  const _$IsEmailCheckImpl({required this.message, required this.check});

  factory _$IsEmailCheckImpl.fromJson(Map<String, dynamic> json) =>
      _$$IsEmailCheckImplFromJson(json);

  @override
  final String message;
  @override
  final bool check;

  @override
  String toString() {
    return 'IsEmailCheck(message: $message, check: $check)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsEmailCheckImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.check, check) || other.check == check));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, check);

  /// Create a copy of IsEmailCheck
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IsEmailCheckImplCopyWith<_$IsEmailCheckImpl> get copyWith =>
      __$$IsEmailCheckImplCopyWithImpl<_$IsEmailCheckImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IsEmailCheckImplToJson(
      this,
    );
  }
}

abstract class _IsEmailCheck implements IsEmailCheck {
  const factory _IsEmailCheck(
      {required final String message,
      required final bool check}) = _$IsEmailCheckImpl;

  factory _IsEmailCheck.fromJson(Map<String, dynamic> json) =
      _$IsEmailCheckImpl.fromJson;

  @override
  String get message;
  @override
  bool get check;

  /// Create a copy of IsEmailCheck
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IsEmailCheckImplCopyWith<_$IsEmailCheckImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
