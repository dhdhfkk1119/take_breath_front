// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatRoomListResponse _$ChatRoomListResponseFromJson(Map<String, dynamic> json) {
  return _ChatRoomListResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatRoomListResponse {
  int get roomId => throw _privateConstructorUsedError;
  String get roomName => throw _privateConstructorUsedError;
  int get unreadCount => throw _privateConstructorUsedError;
  String get lastMessage => throw _privateConstructorUsedError;
  String get lastMessageTime => throw _privateConstructorUsedError;
  int get otherMemberId => throw _privateConstructorUsedError;
  String get otherMemberName => throw _privateConstructorUsedError;

  /// Serializes this ChatRoomListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatRoomListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatRoomListResponseCopyWith<ChatRoomListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomListResponseCopyWith<$Res> {
  factory $ChatRoomListResponseCopyWith(ChatRoomListResponse value,
          $Res Function(ChatRoomListResponse) then) =
      _$ChatRoomListResponseCopyWithImpl<$Res, ChatRoomListResponse>;
  @useResult
  $Res call(
      {int roomId,
      String roomName,
      int unreadCount,
      String lastMessage,
      String lastMessageTime,
      int otherMemberId,
      String otherMemberName});
}

/// @nodoc
class _$ChatRoomListResponseCopyWithImpl<$Res,
        $Val extends ChatRoomListResponse>
    implements $ChatRoomListResponseCopyWith<$Res> {
  _$ChatRoomListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatRoomListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? roomName = null,
    Object? unreadCount = null,
    Object? lastMessage = null,
    Object? lastMessageTime = null,
    Object? otherMemberId = null,
    Object? otherMemberName = null,
  }) {
    return _then(_value.copyWith(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int,
      roomName: null == roomName
          ? _value.roomName
          : roomName // ignore: cast_nullable_to_non_nullable
              as String,
      unreadCount: null == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessageTime: null == lastMessageTime
          ? _value.lastMessageTime
          : lastMessageTime // ignore: cast_nullable_to_non_nullable
              as String,
      otherMemberId: null == otherMemberId
          ? _value.otherMemberId
          : otherMemberId // ignore: cast_nullable_to_non_nullable
              as int,
      otherMemberName: null == otherMemberName
          ? _value.otherMemberName
          : otherMemberName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatRoomListResponseImplCopyWith<$Res>
    implements $ChatRoomListResponseCopyWith<$Res> {
  factory _$$ChatRoomListResponseImplCopyWith(_$ChatRoomListResponseImpl value,
          $Res Function(_$ChatRoomListResponseImpl) then) =
      __$$ChatRoomListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int roomId,
      String roomName,
      int unreadCount,
      String lastMessage,
      String lastMessageTime,
      int otherMemberId,
      String otherMemberName});
}

/// @nodoc
class __$$ChatRoomListResponseImplCopyWithImpl<$Res>
    extends _$ChatRoomListResponseCopyWithImpl<$Res, _$ChatRoomListResponseImpl>
    implements _$$ChatRoomListResponseImplCopyWith<$Res> {
  __$$ChatRoomListResponseImplCopyWithImpl(_$ChatRoomListResponseImpl _value,
      $Res Function(_$ChatRoomListResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatRoomListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? roomName = null,
    Object? unreadCount = null,
    Object? lastMessage = null,
    Object? lastMessageTime = null,
    Object? otherMemberId = null,
    Object? otherMemberName = null,
  }) {
    return _then(_$ChatRoomListResponseImpl(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int,
      roomName: null == roomName
          ? _value.roomName
          : roomName // ignore: cast_nullable_to_non_nullable
              as String,
      unreadCount: null == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessageTime: null == lastMessageTime
          ? _value.lastMessageTime
          : lastMessageTime // ignore: cast_nullable_to_non_nullable
              as String,
      otherMemberId: null == otherMemberId
          ? _value.otherMemberId
          : otherMemberId // ignore: cast_nullable_to_non_nullable
              as int,
      otherMemberName: null == otherMemberName
          ? _value.otherMemberName
          : otherMemberName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatRoomListResponseImpl implements _ChatRoomListResponse {
  const _$ChatRoomListResponseImpl(
      {required this.roomId,
      required this.roomName,
      required this.unreadCount,
      required this.lastMessage,
      required this.lastMessageTime,
      required this.otherMemberId,
      required this.otherMemberName});

  factory _$ChatRoomListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatRoomListResponseImplFromJson(json);

  @override
  final int roomId;
  @override
  final String roomName;
  @override
  final int unreadCount;
  @override
  final String lastMessage;
  @override
  final String lastMessageTime;
  @override
  final int otherMemberId;
  @override
  final String otherMemberName;

  @override
  String toString() {
    return 'ChatRoomListResponse(roomId: $roomId, roomName: $roomName, unreadCount: $unreadCount, lastMessage: $lastMessage, lastMessageTime: $lastMessageTime, otherMemberId: $otherMemberId, otherMemberName: $otherMemberName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomListResponseImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.roomName, roomName) ||
                other.roomName == roomName) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.lastMessageTime, lastMessageTime) ||
                other.lastMessageTime == lastMessageTime) &&
            (identical(other.otherMemberId, otherMemberId) ||
                other.otherMemberId == otherMemberId) &&
            (identical(other.otherMemberName, otherMemberName) ||
                other.otherMemberName == otherMemberName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, roomId, roomName, unreadCount,
      lastMessage, lastMessageTime, otherMemberId, otherMemberName);

  /// Create a copy of ChatRoomListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoomListResponseImplCopyWith<_$ChatRoomListResponseImpl>
      get copyWith =>
          __$$ChatRoomListResponseImplCopyWithImpl<_$ChatRoomListResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatRoomListResponseImplToJson(
      this,
    );
  }
}

abstract class _ChatRoomListResponse implements ChatRoomListResponse {
  const factory _ChatRoomListResponse(
      {required final int roomId,
      required final String roomName,
      required final int unreadCount,
      required final String lastMessage,
      required final String lastMessageTime,
      required final int otherMemberId,
      required final String otherMemberName}) = _$ChatRoomListResponseImpl;

  factory _ChatRoomListResponse.fromJson(Map<String, dynamic> json) =
      _$ChatRoomListResponseImpl.fromJson;

  @override
  int get roomId;
  @override
  String get roomName;
  @override
  int get unreadCount;
  @override
  String get lastMessage;
  @override
  String get lastMessageTime;
  @override
  int get otherMemberId;
  @override
  String get otherMemberName;

  /// Create a copy of ChatRoomListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatRoomListResponseImplCopyWith<_$ChatRoomListResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
