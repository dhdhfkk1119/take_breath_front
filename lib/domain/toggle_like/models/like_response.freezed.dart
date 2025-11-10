// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'like_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LikeResponse _$LikeResponseFromJson(Map<String, dynamic> json) {
  return _LikeResponse.fromJson(json);
}

/// @nodoc
mixin _$LikeResponse {
  bool get liked => throw _privateConstructorUsedError;
  int get likeCount => throw _privateConstructorUsedError;

  /// Serializes this LikeResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LikeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LikeResponseCopyWith<LikeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikeResponseCopyWith<$Res> {
  factory $LikeResponseCopyWith(
          LikeResponse value, $Res Function(LikeResponse) then) =
      _$LikeResponseCopyWithImpl<$Res, LikeResponse>;
  @useResult
  $Res call({bool liked, int likeCount});
}

/// @nodoc
class _$LikeResponseCopyWithImpl<$Res, $Val extends LikeResponse>
    implements $LikeResponseCopyWith<$Res> {
  _$LikeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LikeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? liked = null,
    Object? likeCount = null,
  }) {
    return _then(_value.copyWith(
      liked: null == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LikeResponseImplCopyWith<$Res>
    implements $LikeResponseCopyWith<$Res> {
  factory _$$LikeResponseImplCopyWith(
          _$LikeResponseImpl value, $Res Function(_$LikeResponseImpl) then) =
      __$$LikeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool liked, int likeCount});
}

/// @nodoc
class __$$LikeResponseImplCopyWithImpl<$Res>
    extends _$LikeResponseCopyWithImpl<$Res, _$LikeResponseImpl>
    implements _$$LikeResponseImplCopyWith<$Res> {
  __$$LikeResponseImplCopyWithImpl(
      _$LikeResponseImpl _value, $Res Function(_$LikeResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of LikeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? liked = null,
    Object? likeCount = null,
  }) {
    return _then(_$LikeResponseImpl(
      liked: null == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LikeResponseImpl implements _LikeResponse {
  const _$LikeResponseImpl({required this.liked, required this.likeCount});

  factory _$LikeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LikeResponseImplFromJson(json);

  @override
  final bool liked;
  @override
  final int likeCount;

  @override
  String toString() {
    return 'LikeResponse(liked: $liked, likeCount: $likeCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikeResponseImpl &&
            (identical(other.liked, liked) || other.liked == liked) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, liked, likeCount);

  /// Create a copy of LikeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LikeResponseImplCopyWith<_$LikeResponseImpl> get copyWith =>
      __$$LikeResponseImplCopyWithImpl<_$LikeResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LikeResponseImplToJson(
      this,
    );
  }
}

abstract class _LikeResponse implements LikeResponse {
  const factory _LikeResponse(
      {required final bool liked,
      required final int likeCount}) = _$LikeResponseImpl;

  factory _LikeResponse.fromJson(Map<String, dynamic> json) =
      _$LikeResponseImpl.fromJson;

  @override
  bool get liked;
  @override
  int get likeCount;

  /// Create a copy of LikeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LikeResponseImplCopyWith<_$LikeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
