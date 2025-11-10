// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counselor_license_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CounselorLicenseResponse _$CounselorLicenseResponseFromJson(
    Map<String, dynamic> json) {
  return _CounselorLicenseResponse.fromJson(json);
}

/// @nodoc
mixin _$CounselorLicenseResponse {
  String get licenseName => throw _privateConstructorUsedError;
  String get licenseNumber => throw _privateConstructorUsedError;
  String get licenseRegistrationNumber => throw _privateConstructorUsedError;
  String get licenseImage => throw _privateConstructorUsedError;

  /// Serializes this CounselorLicenseResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CounselorLicenseResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CounselorLicenseResponseCopyWith<CounselorLicenseResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounselorLicenseResponseCopyWith<$Res> {
  factory $CounselorLicenseResponseCopyWith(CounselorLicenseResponse value,
          $Res Function(CounselorLicenseResponse) then) =
      _$CounselorLicenseResponseCopyWithImpl<$Res, CounselorLicenseResponse>;
  @useResult
  $Res call(
      {String licenseName,
      String licenseNumber,
      String licenseRegistrationNumber,
      String licenseImage});
}

/// @nodoc
class _$CounselorLicenseResponseCopyWithImpl<$Res,
        $Val extends CounselorLicenseResponse>
    implements $CounselorLicenseResponseCopyWith<$Res> {
  _$CounselorLicenseResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CounselorLicenseResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? licenseName = null,
    Object? licenseNumber = null,
    Object? licenseRegistrationNumber = null,
    Object? licenseImage = null,
  }) {
    return _then(_value.copyWith(
      licenseName: null == licenseName
          ? _value.licenseName
          : licenseName // ignore: cast_nullable_to_non_nullable
              as String,
      licenseNumber: null == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      licenseRegistrationNumber: null == licenseRegistrationNumber
          ? _value.licenseRegistrationNumber
          : licenseRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      licenseImage: null == licenseImage
          ? _value.licenseImage
          : licenseImage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CounselorLicenseResponseImplCopyWith<$Res>
    implements $CounselorLicenseResponseCopyWith<$Res> {
  factory _$$CounselorLicenseResponseImplCopyWith(
          _$CounselorLicenseResponseImpl value,
          $Res Function(_$CounselorLicenseResponseImpl) then) =
      __$$CounselorLicenseResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String licenseName,
      String licenseNumber,
      String licenseRegistrationNumber,
      String licenseImage});
}

/// @nodoc
class __$$CounselorLicenseResponseImplCopyWithImpl<$Res>
    extends _$CounselorLicenseResponseCopyWithImpl<$Res,
        _$CounselorLicenseResponseImpl>
    implements _$$CounselorLicenseResponseImplCopyWith<$Res> {
  __$$CounselorLicenseResponseImplCopyWithImpl(
      _$CounselorLicenseResponseImpl _value,
      $Res Function(_$CounselorLicenseResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CounselorLicenseResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? licenseName = null,
    Object? licenseNumber = null,
    Object? licenseRegistrationNumber = null,
    Object? licenseImage = null,
  }) {
    return _then(_$CounselorLicenseResponseImpl(
      licenseName: null == licenseName
          ? _value.licenseName
          : licenseName // ignore: cast_nullable_to_non_nullable
              as String,
      licenseNumber: null == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      licenseRegistrationNumber: null == licenseRegistrationNumber
          ? _value.licenseRegistrationNumber
          : licenseRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      licenseImage: null == licenseImage
          ? _value.licenseImage
          : licenseImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CounselorLicenseResponseImpl implements _CounselorLicenseResponse {
  const _$CounselorLicenseResponseImpl(
      {required this.licenseName,
      required this.licenseNumber,
      required this.licenseRegistrationNumber,
      required this.licenseImage});

  factory _$CounselorLicenseResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CounselorLicenseResponseImplFromJson(json);

  @override
  final String licenseName;
  @override
  final String licenseNumber;
  @override
  final String licenseRegistrationNumber;
  @override
  final String licenseImage;

  @override
  String toString() {
    return 'CounselorLicenseResponse(licenseName: $licenseName, licenseNumber: $licenseNumber, licenseRegistrationNumber: $licenseRegistrationNumber, licenseImage: $licenseImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CounselorLicenseResponseImpl &&
            (identical(other.licenseName, licenseName) ||
                other.licenseName == licenseName) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber) &&
            (identical(other.licenseRegistrationNumber,
                    licenseRegistrationNumber) ||
                other.licenseRegistrationNumber == licenseRegistrationNumber) &&
            (identical(other.licenseImage, licenseImage) ||
                other.licenseImage == licenseImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, licenseName, licenseNumber,
      licenseRegistrationNumber, licenseImage);

  /// Create a copy of CounselorLicenseResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CounselorLicenseResponseImplCopyWith<_$CounselorLicenseResponseImpl>
      get copyWith => __$$CounselorLicenseResponseImplCopyWithImpl<
          _$CounselorLicenseResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CounselorLicenseResponseImplToJson(
      this,
    );
  }
}

abstract class _CounselorLicenseResponse implements CounselorLicenseResponse {
  const factory _CounselorLicenseResponse(
      {required final String licenseName,
      required final String licenseNumber,
      required final String licenseRegistrationNumber,
      required final String licenseImage}) = _$CounselorLicenseResponseImpl;

  factory _CounselorLicenseResponse.fromJson(Map<String, dynamic> json) =
      _$CounselorLicenseResponseImpl.fromJson;

  @override
  String get licenseName;
  @override
  String get licenseNumber;
  @override
  String get licenseRegistrationNumber;
  @override
  String get licenseImage;

  /// Create a copy of CounselorLicenseResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CounselorLicenseResponseImplCopyWith<_$CounselorLicenseResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
