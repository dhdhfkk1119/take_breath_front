// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counselor_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CounselorResponse _$CounselorResponseFromJson(Map<String, dynamic> json) {
  return _CounselorResponse.fromJson(json);
}

/// @nodoc
mixin _$CounselorResponse {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get license => throw _privateConstructorUsedError;
  String? get specialty => throw _privateConstructorUsedError;
  String? get introduction => throw _privateConstructorUsedError;
  String? get profileImage => throw _privateConstructorUsedError;
  String? get hashtags => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  int get likeCount => throw _privateConstructorUsedError;
  bool? get likedByMe => throw _privateConstructorUsedError;
  List<CounselorLicenseResponse>? get licenses =>
      throw _privateConstructorUsedError;

  /// Serializes this CounselorResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CounselorResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CounselorResponseCopyWith<CounselorResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounselorResponseCopyWith<$Res> {
  factory $CounselorResponseCopyWith(
          CounselorResponse value, $Res Function(CounselorResponse) then) =
      _$CounselorResponseCopyWithImpl<$Res, CounselorResponse>;
  @useResult
  $Res call(
      {int id,
      String name,
      String? license,
      String? specialty,
      String? introduction,
      String? profileImage,
      String? hashtags,
      String? gender,
      int price,
      int likeCount,
      bool? likedByMe,
      List<CounselorLicenseResponse>? licenses});
}

/// @nodoc
class _$CounselorResponseCopyWithImpl<$Res, $Val extends CounselorResponse>
    implements $CounselorResponseCopyWith<$Res> {
  _$CounselorResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CounselorResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? license = freezed,
    Object? specialty = freezed,
    Object? introduction = freezed,
    Object? profileImage = freezed,
    Object? hashtags = freezed,
    Object? gender = freezed,
    Object? price = null,
    Object? likeCount = null,
    Object? likedByMe = freezed,
    Object? licenses = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      license: freezed == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String?,
      specialty: freezed == specialty
          ? _value.specialty
          : specialty // ignore: cast_nullable_to_non_nullable
              as String?,
      introduction: freezed == introduction
          ? _value.introduction
          : introduction // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      hashtags: freezed == hashtags
          ? _value.hashtags
          : hashtags // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      likedByMe: freezed == likedByMe
          ? _value.likedByMe
          : likedByMe // ignore: cast_nullable_to_non_nullable
              as bool?,
      licenses: freezed == licenses
          ? _value.licenses
          : licenses // ignore: cast_nullable_to_non_nullable
              as List<CounselorLicenseResponse>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CounselorResponseImplCopyWith<$Res>
    implements $CounselorResponseCopyWith<$Res> {
  factory _$$CounselorResponseImplCopyWith(_$CounselorResponseImpl value,
          $Res Function(_$CounselorResponseImpl) then) =
      __$$CounselorResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? license,
      String? specialty,
      String? introduction,
      String? profileImage,
      String? hashtags,
      String? gender,
      int price,
      int likeCount,
      bool? likedByMe,
      List<CounselorLicenseResponse>? licenses});
}

/// @nodoc
class __$$CounselorResponseImplCopyWithImpl<$Res>
    extends _$CounselorResponseCopyWithImpl<$Res, _$CounselorResponseImpl>
    implements _$$CounselorResponseImplCopyWith<$Res> {
  __$$CounselorResponseImplCopyWithImpl(_$CounselorResponseImpl _value,
      $Res Function(_$CounselorResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CounselorResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? license = freezed,
    Object? specialty = freezed,
    Object? introduction = freezed,
    Object? profileImage = freezed,
    Object? hashtags = freezed,
    Object? gender = freezed,
    Object? price = null,
    Object? likeCount = null,
    Object? likedByMe = freezed,
    Object? licenses = freezed,
  }) {
    return _then(_$CounselorResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      license: freezed == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String?,
      specialty: freezed == specialty
          ? _value.specialty
          : specialty // ignore: cast_nullable_to_non_nullable
              as String?,
      introduction: freezed == introduction
          ? _value.introduction
          : introduction // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      hashtags: freezed == hashtags
          ? _value.hashtags
          : hashtags // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      likedByMe: freezed == likedByMe
          ? _value.likedByMe
          : likedByMe // ignore: cast_nullable_to_non_nullable
              as bool?,
      licenses: freezed == licenses
          ? _value._licenses
          : licenses // ignore: cast_nullable_to_non_nullable
              as List<CounselorLicenseResponse>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CounselorResponseImpl implements _CounselorResponse {
  const _$CounselorResponseImpl(
      {required this.id,
      required this.name,
      this.license,
      this.specialty,
      this.introduction,
      this.profileImage,
      this.hashtags,
      this.gender,
      required this.price,
      this.likeCount = 0,
      this.likedByMe,
      final List<CounselorLicenseResponse>? licenses})
      : _licenses = licenses;

  factory _$CounselorResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CounselorResponseImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? license;
  @override
  final String? specialty;
  @override
  final String? introduction;
  @override
  final String? profileImage;
  @override
  final String? hashtags;
  @override
  final String? gender;
  @override
  final int price;
  @override
  @JsonKey()
  final int likeCount;
  @override
  final bool? likedByMe;
  final List<CounselorLicenseResponse>? _licenses;
  @override
  List<CounselorLicenseResponse>? get licenses {
    final value = _licenses;
    if (value == null) return null;
    if (_licenses is EqualUnmodifiableListView) return _licenses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CounselorResponse(id: $id, name: $name, license: $license, specialty: $specialty, introduction: $introduction, profileImage: $profileImage, hashtags: $hashtags, gender: $gender, price: $price, likeCount: $likeCount, likedByMe: $likedByMe, licenses: $licenses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CounselorResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.license, license) || other.license == license) &&
            (identical(other.specialty, specialty) ||
                other.specialty == specialty) &&
            (identical(other.introduction, introduction) ||
                other.introduction == introduction) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.hashtags, hashtags) ||
                other.hashtags == hashtags) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.likedByMe, likedByMe) ||
                other.likedByMe == likedByMe) &&
            const DeepCollectionEquality().equals(other._licenses, _licenses));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      license,
      specialty,
      introduction,
      profileImage,
      hashtags,
      gender,
      price,
      likeCount,
      likedByMe,
      const DeepCollectionEquality().hash(_licenses));

  /// Create a copy of CounselorResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CounselorResponseImplCopyWith<_$CounselorResponseImpl> get copyWith =>
      __$$CounselorResponseImplCopyWithImpl<_$CounselorResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CounselorResponseImplToJson(
      this,
    );
  }
}

abstract class _CounselorResponse implements CounselorResponse {
  const factory _CounselorResponse(
          {required final int id,
          required final String name,
          final String? license,
          final String? specialty,
          final String? introduction,
          final String? profileImage,
          final String? hashtags,
          final String? gender,
          required final int price,
          final int likeCount,
          final bool? likedByMe,
          final List<CounselorLicenseResponse>? licenses}) =
      _$CounselorResponseImpl;

  factory _CounselorResponse.fromJson(Map<String, dynamic> json) =
      _$CounselorResponseImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get license;
  @override
  String? get specialty;
  @override
  String? get introduction;
  @override
  String? get profileImage;
  @override
  String? get hashtags;
  @override
  String? get gender;
  @override
  int get price;
  @override
  int get likeCount;
  @override
  bool? get likedByMe;
  @override
  List<CounselorLicenseResponse>? get licenses;

  /// Create a copy of CounselorResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CounselorResponseImplCopyWith<_$CounselorResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
