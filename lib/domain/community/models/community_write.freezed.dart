// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_write.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CommunityWrite {
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  int? get categoryId => throw _privateConstructorUsedError;
  List<File>? get images => throw _privateConstructorUsedError;

  /// Create a copy of CommunityWrite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommunityWriteCopyWith<CommunityWrite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunityWriteCopyWith<$Res> {
  factory $CommunityWriteCopyWith(
          CommunityWrite value, $Res Function(CommunityWrite) then) =
      _$CommunityWriteCopyWithImpl<$Res, CommunityWrite>;
  @useResult
  $Res call(
      {String title, String content, int? categoryId, List<File>? images});
}

/// @nodoc
class _$CommunityWriteCopyWithImpl<$Res, $Val extends CommunityWrite>
    implements $CommunityWriteCopyWith<$Res> {
  _$CommunityWriteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommunityWrite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? categoryId = freezed,
    Object? images = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<File>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommunityWriteImplCopyWith<$Res>
    implements $CommunityWriteCopyWith<$Res> {
  factory _$$CommunityWriteImplCopyWith(_$CommunityWriteImpl value,
          $Res Function(_$CommunityWriteImpl) then) =
      __$$CommunityWriteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title, String content, int? categoryId, List<File>? images});
}

/// @nodoc
class __$$CommunityWriteImplCopyWithImpl<$Res>
    extends _$CommunityWriteCopyWithImpl<$Res, _$CommunityWriteImpl>
    implements _$$CommunityWriteImplCopyWith<$Res> {
  __$$CommunityWriteImplCopyWithImpl(
      _$CommunityWriteImpl _value, $Res Function(_$CommunityWriteImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommunityWrite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? categoryId = freezed,
    Object? images = freezed,
  }) {
    return _then(_$CommunityWriteImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<File>?,
    ));
  }
}

/// @nodoc

class _$CommunityWriteImpl implements _CommunityWrite {
  const _$CommunityWriteImpl(
      {required this.title,
      required this.content,
      this.categoryId = 0,
      final List<File>? images = null})
      : _images = images;

  @override
  final String title;
  @override
  final String content;
  @override
  @JsonKey()
  final int? categoryId;
  final List<File>? _images;
  @override
  @JsonKey()
  List<File>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CommunityWrite(title: $title, content: $content, categoryId: $categoryId, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunityWriteImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, content, categoryId,
      const DeepCollectionEquality().hash(_images));

  /// Create a copy of CommunityWrite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunityWriteImplCopyWith<_$CommunityWriteImpl> get copyWith =>
      __$$CommunityWriteImplCopyWithImpl<_$CommunityWriteImpl>(
          this, _$identity);
}

abstract class _CommunityWrite implements CommunityWrite {
  const factory _CommunityWrite(
      {required final String title,
      required final String content,
      final int? categoryId,
      final List<File>? images}) = _$CommunityWriteImpl;

  @override
  String get title;
  @override
  String get content;
  @override
  int? get categoryId;
  @override
  List<File>? get images;

  /// Create a copy of CommunityWrite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommunityWriteImplCopyWith<_$CommunityWriteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
