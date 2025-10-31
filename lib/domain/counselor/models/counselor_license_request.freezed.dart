// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counselor_license_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CounselorLicenseRequest _$CounselorLicenseRequestFromJson(
    Map<String, dynamic> json) {
  return _CounselorLicenseRequest.fromJson(json);
}

/// @nodoc
mixin _$CounselorLicenseRequest {
  int get id => throw _privateConstructorUsedError;
  String get licenseName => throw _privateConstructorUsedError;
  String get licenseNumber => throw _privateConstructorUsedError;
  String get licenseRegiNumber => throw _privateConstructorUsedError;
  String get licenseImage => throw _privateConstructorUsedError;

  /// Serializes this CounselorLicenseRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CounselorLicenseRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CounselorLicenseRequestCopyWith<CounselorLicenseRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounselorLicenseRequestCopyWith<$Res> {
  factory $CounselorLicenseRequestCopyWith(CounselorLicenseRequest value,
          $Res Function(CounselorLicenseRequest) then) =
      _$CounselorLicenseRequestCopyWithImpl<$Res, CounselorLicenseRequest>;
  @useResult
  $Res call(
      {int id,
      String licenseName,
      String licenseNumber,
      String licenseRegiNumber,
      String licenseImage});
}

/// @nodoc
class _$CounselorLicenseRequestCopyWithImpl<$Res,
        $Val extends CounselorLicenseRequest>
    implements $CounselorLicenseRequestCopyWith<$Res> {
  _$CounselorLicenseRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CounselorLicenseRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? licenseName = null,
    Object? licenseNumber = null,
    Object? licenseRegiNumber = null,
    Object? licenseImage = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      licenseName: null == licenseName
          ? _value.licenseName
          : licenseName // ignore: cast_nullable_to_non_nullable
              as String,
      licenseNumber: null == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      licenseRegiNumber: null == licenseRegiNumber
          ? _value.licenseRegiNumber
          : licenseRegiNumber // ignore: cast_nullable_to_non_nullable
              as String,
      licenseImage: null == licenseImage
          ? _value.licenseImage
          : licenseImage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CounselorLicenseRequestImplCopyWith<$Res>
    implements $CounselorLicenseRequestCopyWith<$Res> {
  factory _$$CounselorLicenseRequestImplCopyWith(
          _$CounselorLicenseRequestImpl value,
          $Res Function(_$CounselorLicenseRequestImpl) then) =
      __$$CounselorLicenseRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String licenseName,
      String licenseNumber,
      String licenseRegiNumber,
      String licenseImage});
}

/// @nodoc
class __$$CounselorLicenseRequestImplCopyWithImpl<$Res>
    extends _$CounselorLicenseRequestCopyWithImpl<$Res,
        _$CounselorLicenseRequestImpl>
    implements _$$CounselorLicenseRequestImplCopyWith<$Res> {
  __$$CounselorLicenseRequestImplCopyWithImpl(
      _$CounselorLicenseRequestImpl _value,
      $Res Function(_$CounselorLicenseRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CounselorLicenseRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? licenseName = null,
    Object? licenseNumber = null,
    Object? licenseRegiNumber = null,
    Object? licenseImage = null,
  }) {
    return _then(_$CounselorLicenseRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      licenseName: null == licenseName
          ? _value.licenseName
          : licenseName // ignore: cast_nullable_to_non_nullable
              as String,
      licenseNumber: null == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      licenseRegiNumber: null == licenseRegiNumber
          ? _value.licenseRegiNumber
          : licenseRegiNumber // ignore: cast_nullable_to_non_nullable
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
class _$CounselorLicenseRequestImpl implements _CounselorLicenseRequest {
  const _$CounselorLicenseRequestImpl(
      {required this.id,
      required this.licenseName,
      required this.licenseNumber,
      required this.licenseRegiNumber,
      required this.licenseImage});

  factory _$CounselorLicenseRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CounselorLicenseRequestImplFromJson(json);

  @override
  final int id;
  @override
  final String licenseName;
  @override
  final String licenseNumber;
  @override
  final String licenseRegiNumber;
  @override
  final String licenseImage;

  @override
  String toString() {
    return 'CounselorLicenseRequest(id: $id, licenseName: $licenseName, licenseNumber: $licenseNumber, licenseRegiNumber: $licenseRegiNumber, licenseImage: $licenseImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CounselorLicenseRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.licenseName, licenseName) ||
                other.licenseName == licenseName) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber) &&
            (identical(other.licenseRegiNumber, licenseRegiNumber) ||
                other.licenseRegiNumber == licenseRegiNumber) &&
            (identical(other.licenseImage, licenseImage) ||
                other.licenseImage == licenseImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, licenseName, licenseNumber,
      licenseRegiNumber, licenseImage);

  /// Create a copy of CounselorLicenseRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CounselorLicenseRequestImplCopyWith<_$CounselorLicenseRequestImpl>
      get copyWith => __$$CounselorLicenseRequestImplCopyWithImpl<
          _$CounselorLicenseRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CounselorLicenseRequestImplToJson(
      this,
    );
  }
}

abstract class _CounselorLicenseRequest implements CounselorLicenseRequest {
  const factory _CounselorLicenseRequest(
      {required final int id,
      required final String licenseName,
      required final String licenseNumber,
      required final String licenseRegiNumber,
      required final String licenseImage}) = _$CounselorLicenseRequestImpl;

  factory _CounselorLicenseRequest.fromJson(Map<String, dynamic> json) =
      _$CounselorLicenseRequestImpl.fromJson;

  @override
  int get id;
  @override
  String get licenseName;
  @override
  String get licenseNumber;
  @override
  String get licenseRegiNumber;
  @override
  String get licenseImage;

  /// Create a copy of CounselorLicenseRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CounselorLicenseRequestImplCopyWith<_$CounselorLicenseRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
