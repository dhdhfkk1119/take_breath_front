// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommunityImage _$CommunityImageFromJson(Map<String, dynamic> json) {
  return _CommunityImage.fromJson(json);
}

/// @nodoc
mixin _$CommunityImage {
  int get id => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this CommunityImage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommunityImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommunityImageCopyWith<CommunityImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunityImageCopyWith<$Res> {
  factory $CommunityImageCopyWith(
          CommunityImage value, $Res Function(CommunityImage) then) =
      _$CommunityImageCopyWithImpl<$Res, CommunityImage>;
  @useResult
  $Res call({int id, String imageUrl});
}

/// @nodoc
class _$CommunityImageCopyWithImpl<$Res, $Val extends CommunityImage>
    implements $CommunityImageCopyWith<$Res> {
  _$CommunityImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommunityImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommunityImageImplCopyWith<$Res>
    implements $CommunityImageCopyWith<$Res> {
  factory _$$CommunityImageImplCopyWith(_$CommunityImageImpl value,
          $Res Function(_$CommunityImageImpl) then) =
      __$$CommunityImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String imageUrl});
}

/// @nodoc
class __$$CommunityImageImplCopyWithImpl<$Res>
    extends _$CommunityImageCopyWithImpl<$Res, _$CommunityImageImpl>
    implements _$$CommunityImageImplCopyWith<$Res> {
  __$$CommunityImageImplCopyWithImpl(
      _$CommunityImageImpl _value, $Res Function(_$CommunityImageImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommunityImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
  }) {
    return _then(_$CommunityImageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommunityImageImpl implements _CommunityImage {
  const _$CommunityImageImpl({required this.id, required this.imageUrl});

  factory _$CommunityImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommunityImageImplFromJson(json);

  @override
  final int id;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'CommunityImage(id: $id, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunityImageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, imageUrl);

  /// Create a copy of CommunityImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunityImageImplCopyWith<_$CommunityImageImpl> get copyWith =>
      __$$CommunityImageImplCopyWithImpl<_$CommunityImageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommunityImageImplToJson(
      this,
    );
  }
}

abstract class _CommunityImage implements CommunityImage {
  const factory _CommunityImage(
      {required final int id,
      required final String imageUrl}) = _$CommunityImageImpl;

  factory _CommunityImage.fromJson(Map<String, dynamic> json) =
      _$CommunityImageImpl.fromJson;

  @override
  int get id;
  @override
  String get imageUrl;

  /// Create a copy of CommunityImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommunityImageImplCopyWith<_$CommunityImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
