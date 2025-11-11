// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room_slice_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatRoomSliceResponse _$ChatRoomSliceResponseFromJson(
    Map<String, dynamic> json) {
  return _ChatRoomSliceResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatRoomSliceResponse {
  List<ChatRoomListResponse> get content => throw _privateConstructorUsedError;
  int get pageNumber => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  bool get hasNext => throw _privateConstructorUsedError;
  bool get isFirst => throw _privateConstructorUsedError;
  bool get isLast => throw _privateConstructorUsedError;

  /// Serializes this ChatRoomSliceResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatRoomSliceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatRoomSliceResponseCopyWith<ChatRoomSliceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomSliceResponseCopyWith<$Res> {
  factory $ChatRoomSliceResponseCopyWith(ChatRoomSliceResponse value,
          $Res Function(ChatRoomSliceResponse) then) =
      _$ChatRoomSliceResponseCopyWithImpl<$Res, ChatRoomSliceResponse>;
  @useResult
  $Res call(
      {List<ChatRoomListResponse> content,
      int pageNumber,
      int pageSize,
      bool hasNext,
      bool isFirst,
      bool isLast});
}

/// @nodoc
class _$ChatRoomSliceResponseCopyWithImpl<$Res,
        $Val extends ChatRoomSliceResponse>
    implements $ChatRoomSliceResponseCopyWith<$Res> {
  _$ChatRoomSliceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatRoomSliceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? pageNumber = null,
    Object? pageSize = null,
    Object? hasNext = null,
    Object? isFirst = null,
    Object? isLast = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<ChatRoomListResponse>,
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      isFirst: null == isFirst
          ? _value.isFirst
          : isFirst // ignore: cast_nullable_to_non_nullable
              as bool,
      isLast: null == isLast
          ? _value.isLast
          : isLast // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatRoomSliceResponseImplCopyWith<$Res>
    implements $ChatRoomSliceResponseCopyWith<$Res> {
  factory _$$ChatRoomSliceResponseImplCopyWith(
          _$ChatRoomSliceResponseImpl value,
          $Res Function(_$ChatRoomSliceResponseImpl) then) =
      __$$ChatRoomSliceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ChatRoomListResponse> content,
      int pageNumber,
      int pageSize,
      bool hasNext,
      bool isFirst,
      bool isLast});
}

/// @nodoc
class __$$ChatRoomSliceResponseImplCopyWithImpl<$Res>
    extends _$ChatRoomSliceResponseCopyWithImpl<$Res,
        _$ChatRoomSliceResponseImpl>
    implements _$$ChatRoomSliceResponseImplCopyWith<$Res> {
  __$$ChatRoomSliceResponseImplCopyWithImpl(_$ChatRoomSliceResponseImpl _value,
      $Res Function(_$ChatRoomSliceResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatRoomSliceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? pageNumber = null,
    Object? pageSize = null,
    Object? hasNext = null,
    Object? isFirst = null,
    Object? isLast = null,
  }) {
    return _then(_$ChatRoomSliceResponseImpl(
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<ChatRoomListResponse>,
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      isFirst: null == isFirst
          ? _value.isFirst
          : isFirst // ignore: cast_nullable_to_non_nullable
              as bool,
      isLast: null == isLast
          ? _value.isLast
          : isLast // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatRoomSliceResponseImpl implements _ChatRoomSliceResponse {
  const _$ChatRoomSliceResponseImpl(
      {required final List<ChatRoomListResponse> content,
      required this.pageNumber,
      required this.pageSize,
      required this.hasNext,
      required this.isFirst,
      required this.isLast})
      : _content = content;

  factory _$ChatRoomSliceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatRoomSliceResponseImplFromJson(json);

  final List<ChatRoomListResponse> _content;
  @override
  List<ChatRoomListResponse> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  final int pageNumber;
  @override
  final int pageSize;
  @override
  final bool hasNext;
  @override
  final bool isFirst;
  @override
  final bool isLast;

  @override
  String toString() {
    return 'ChatRoomSliceResponse(content: $content, pageNumber: $pageNumber, pageSize: $pageSize, hasNext: $hasNext, isFirst: $isFirst, isLast: $isLast)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomSliceResponseImpl &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext) &&
            (identical(other.isFirst, isFirst) || other.isFirst == isFirst) &&
            (identical(other.isLast, isLast) || other.isLast == isLast));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_content),
      pageNumber,
      pageSize,
      hasNext,
      isFirst,
      isLast);

  /// Create a copy of ChatRoomSliceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoomSliceResponseImplCopyWith<_$ChatRoomSliceResponseImpl>
      get copyWith => __$$ChatRoomSliceResponseImplCopyWithImpl<
          _$ChatRoomSliceResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatRoomSliceResponseImplToJson(
      this,
    );
  }
}

abstract class _ChatRoomSliceResponse implements ChatRoomSliceResponse {
  const factory _ChatRoomSliceResponse(
      {required final List<ChatRoomListResponse> content,
      required final int pageNumber,
      required final int pageSize,
      required final bool hasNext,
      required final bool isFirst,
      required final bool isLast}) = _$ChatRoomSliceResponseImpl;

  factory _ChatRoomSliceResponse.fromJson(Map<String, dynamic> json) =
      _$ChatRoomSliceResponseImpl.fromJson;

  @override
  List<ChatRoomListResponse> get content;
  @override
  int get pageNumber;
  @override
  int get pageSize;
  @override
  bool get hasNext;
  @override
  bool get isFirst;
  @override
  bool get isLast;

  /// Create a copy of ChatRoomSliceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatRoomSliceResponseImplCopyWith<_$ChatRoomSliceResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
