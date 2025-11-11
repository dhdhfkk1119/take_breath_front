// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatMessageResponse _$ChatMessageResponseFromJson(Map<String, dynamic> json) {
  return _ChatMessageResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatMessageResponse {
  int get messageId => throw _privateConstructorUsedError;
  int get senderId => throw _privateConstructorUsedError;
  String get senderName => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  String get messageType => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get attachmentPath => throw _privateConstructorUsedError;
  int? get currentPoint => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;

  /// Serializes this ChatMessageResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatMessageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatMessageResponseCopyWith<ChatMessageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageResponseCopyWith<$Res> {
  factory $ChatMessageResponseCopyWith(
          ChatMessageResponse value, $Res Function(ChatMessageResponse) then) =
      _$ChatMessageResponseCopyWithImpl<$Res, ChatMessageResponse>;
  @useResult
  $Res call(
      {int messageId,
      int senderId,
      String senderName,
      String? content,
      String messageType,
      DateTime createdAt,
      String? attachmentPath,
      int? currentPoint,
      bool isRead});
}

/// @nodoc
class _$ChatMessageResponseCopyWithImpl<$Res, $Val extends ChatMessageResponse>
    implements $ChatMessageResponseCopyWith<$Res> {
  _$ChatMessageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatMessageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
    Object? senderId = null,
    Object? senderName = null,
    Object? content = freezed,
    Object? messageType = null,
    Object? createdAt = null,
    Object? attachmentPath = freezed,
    Object? currentPoint = freezed,
    Object? isRead = null,
  }) {
    return _then(_value.copyWith(
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as int,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as int,
      senderName: null == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      messageType: null == messageType
          ? _value.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      attachmentPath: freezed == attachmentPath
          ? _value.attachmentPath
          : attachmentPath // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPoint: freezed == currentPoint
          ? _value.currentPoint
          : currentPoint // ignore: cast_nullable_to_non_nullable
              as int?,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatMessageResponseImplCopyWith<$Res>
    implements $ChatMessageResponseCopyWith<$Res> {
  factory _$$ChatMessageResponseImplCopyWith(_$ChatMessageResponseImpl value,
          $Res Function(_$ChatMessageResponseImpl) then) =
      __$$ChatMessageResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int messageId,
      int senderId,
      String senderName,
      String? content,
      String messageType,
      DateTime createdAt,
      String? attachmentPath,
      int? currentPoint,
      bool isRead});
}

/// @nodoc
class __$$ChatMessageResponseImplCopyWithImpl<$Res>
    extends _$ChatMessageResponseCopyWithImpl<$Res, _$ChatMessageResponseImpl>
    implements _$$ChatMessageResponseImplCopyWith<$Res> {
  __$$ChatMessageResponseImplCopyWithImpl(_$ChatMessageResponseImpl _value,
      $Res Function(_$ChatMessageResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatMessageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
    Object? senderId = null,
    Object? senderName = null,
    Object? content = freezed,
    Object? messageType = null,
    Object? createdAt = null,
    Object? attachmentPath = freezed,
    Object? currentPoint = freezed,
    Object? isRead = null,
  }) {
    return _then(_$ChatMessageResponseImpl(
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as int,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as int,
      senderName: null == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      messageType: null == messageType
          ? _value.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      attachmentPath: freezed == attachmentPath
          ? _value.attachmentPath
          : attachmentPath // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPoint: freezed == currentPoint
          ? _value.currentPoint
          : currentPoint // ignore: cast_nullable_to_non_nullable
              as int?,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMessageResponseImpl implements _ChatMessageResponse {
  const _$ChatMessageResponseImpl(
      {required this.messageId,
      required this.senderId,
      required this.senderName,
      this.content,
      required this.messageType,
      required this.createdAt,
      this.attachmentPath,
      this.currentPoint,
      required this.isRead});

  factory _$ChatMessageResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMessageResponseImplFromJson(json);

  @override
  final int messageId;
  @override
  final int senderId;
  @override
  final String senderName;
  @override
  final String? content;
  @override
  final String messageType;
  @override
  final DateTime createdAt;
  @override
  final String? attachmentPath;
  @override
  final int? currentPoint;
  @override
  final bool isRead;

  @override
  String toString() {
    return 'ChatMessageResponse(messageId: $messageId, senderId: $senderId, senderName: $senderName, content: $content, messageType: $messageType, createdAt: $createdAt, attachmentPath: $attachmentPath, currentPoint: $currentPoint, isRead: $isRead)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessageResponseImpl &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.messageType, messageType) ||
                other.messageType == messageType) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.attachmentPath, attachmentPath) ||
                other.attachmentPath == attachmentPath) &&
            (identical(other.currentPoint, currentPoint) ||
                other.currentPoint == currentPoint) &&
            (identical(other.isRead, isRead) || other.isRead == isRead));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, messageId, senderId, senderName,
      content, messageType, createdAt, attachmentPath, currentPoint, isRead);

  /// Create a copy of ChatMessageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessageResponseImplCopyWith<_$ChatMessageResponseImpl> get copyWith =>
      __$$ChatMessageResponseImplCopyWithImpl<_$ChatMessageResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMessageResponseImplToJson(
      this,
    );
  }
}

abstract class _ChatMessageResponse implements ChatMessageResponse {
  const factory _ChatMessageResponse(
      {required final int messageId,
      required final int senderId,
      required final String senderName,
      final String? content,
      required final String messageType,
      required final DateTime createdAt,
      final String? attachmentPath,
      final int? currentPoint,
      required final bool isRead}) = _$ChatMessageResponseImpl;

  factory _ChatMessageResponse.fromJson(Map<String, dynamic> json) =
      _$ChatMessageResponseImpl.fromJson;

  @override
  int get messageId;
  @override
  int get senderId;
  @override
  String get senderName;
  @override
  String? get content;
  @override
  String get messageType;
  @override
  DateTime get createdAt;
  @override
  String? get attachmentPath;
  @override
  int? get currentPoint;
  @override
  bool get isRead;

  /// Create a copy of ChatMessageResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatMessageResponseImplCopyWith<_$ChatMessageResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
