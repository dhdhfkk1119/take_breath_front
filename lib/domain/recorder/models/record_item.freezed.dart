// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'record_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecordItem {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  int get imageCount => throw _privateConstructorUsedError;
  int get audioCount => throw _privateConstructorUsedError;

  /// Create a copy of RecordItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecordItemCopyWith<RecordItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordItemCopyWith<$Res> {
  factory $RecordItemCopyWith(
          RecordItem value, $Res Function(RecordItem) then) =
      _$RecordItemCopyWithImpl<$Res, RecordItem>;
  @useResult
  $Res call(
      {int id,
      String title,
      String content,
      String date,
      int imageCount,
      int audioCount});
}

/// @nodoc
class _$RecordItemCopyWithImpl<$Res, $Val extends RecordItem>
    implements $RecordItemCopyWith<$Res> {
  _$RecordItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecordItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? date = null,
    Object? imageCount = null,
    Object? audioCount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      imageCount: null == imageCount
          ? _value.imageCount
          : imageCount // ignore: cast_nullable_to_non_nullable
              as int,
      audioCount: null == audioCount
          ? _value.audioCount
          : audioCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecordItemImplCopyWith<$Res>
    implements $RecordItemCopyWith<$Res> {
  factory _$$RecordItemImplCopyWith(
          _$RecordItemImpl value, $Res Function(_$RecordItemImpl) then) =
      __$$RecordItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String content,
      String date,
      int imageCount,
      int audioCount});
}

/// @nodoc
class __$$RecordItemImplCopyWithImpl<$Res>
    extends _$RecordItemCopyWithImpl<$Res, _$RecordItemImpl>
    implements _$$RecordItemImplCopyWith<$Res> {
  __$$RecordItemImplCopyWithImpl(
      _$RecordItemImpl _value, $Res Function(_$RecordItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecordItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? date = null,
    Object? imageCount = null,
    Object? audioCount = null,
  }) {
    return _then(_$RecordItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      imageCount: null == imageCount
          ? _value.imageCount
          : imageCount // ignore: cast_nullable_to_non_nullable
              as int,
      audioCount: null == audioCount
          ? _value.audioCount
          : audioCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RecordItemImpl implements _RecordItem {
  const _$RecordItemImpl(
      {required this.id,
      required this.title,
      required this.content,
      required this.date,
      required this.imageCount,
      required this.audioCount});

  @override
  final int id;
  @override
  final String title;
  @override
  final String content;
  @override
  final String date;
  @override
  final int imageCount;
  @override
  final int audioCount;

  @override
  String toString() {
    return 'RecordItem(id: $id, title: $title, content: $content, date: $date, imageCount: $imageCount, audioCount: $audioCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.imageCount, imageCount) ||
                other.imageCount == imageCount) &&
            (identical(other.audioCount, audioCount) ||
                other.audioCount == audioCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, content, date, imageCount, audioCount);

  /// Create a copy of RecordItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordItemImplCopyWith<_$RecordItemImpl> get copyWith =>
      __$$RecordItemImplCopyWithImpl<_$RecordItemImpl>(this, _$identity);
}

abstract class _RecordItem implements RecordItem {
  const factory _RecordItem(
      {required final int id,
      required final String title,
      required final String content,
      required final String date,
      required final int imageCount,
      required final int audioCount}) = _$RecordItemImpl;

  @override
  int get id;
  @override
  String get title;
  @override
  String get content;
  @override
  String get date;
  @override
  int get imageCount;
  @override
  int get audioCount;

  /// Create a copy of RecordItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecordItemImplCopyWith<_$RecordItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
