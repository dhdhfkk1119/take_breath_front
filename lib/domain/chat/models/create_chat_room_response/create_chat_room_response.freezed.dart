// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_chat_room_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateChatRoomResponse _$CreateChatRoomResponseFromJson(
    Map<String, dynamic> json) {
  return _CreateChatRoomResponse.fromJson(json);
}

/// @nodoc
mixin _$CreateChatRoomResponse {
  int get roomId => throw _privateConstructorUsedError;
  String get roomName => throw _privateConstructorUsedError;

  /// Serializes this CreateChatRoomResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateChatRoomResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateChatRoomResponseCopyWith<CreateChatRoomResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateChatRoomResponseCopyWith<$Res> {
  factory $CreateChatRoomResponseCopyWith(CreateChatRoomResponse value,
          $Res Function(CreateChatRoomResponse) then) =
      _$CreateChatRoomResponseCopyWithImpl<$Res, CreateChatRoomResponse>;
  @useResult
  $Res call({int roomId, String roomName});
}

/// @nodoc
class _$CreateChatRoomResponseCopyWithImpl<$Res,
        $Val extends CreateChatRoomResponse>
    implements $CreateChatRoomResponseCopyWith<$Res> {
  _$CreateChatRoomResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateChatRoomResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? roomName = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateChatRoomResponseImplCopyWith<$Res>
    implements $CreateChatRoomResponseCopyWith<$Res> {
  factory _$$CreateChatRoomResponseImplCopyWith(
          _$CreateChatRoomResponseImpl value,
          $Res Function(_$CreateChatRoomResponseImpl) then) =
      __$$CreateChatRoomResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int roomId, String roomName});
}

/// @nodoc
class __$$CreateChatRoomResponseImplCopyWithImpl<$Res>
    extends _$CreateChatRoomResponseCopyWithImpl<$Res,
        _$CreateChatRoomResponseImpl>
    implements _$$CreateChatRoomResponseImplCopyWith<$Res> {
  __$$CreateChatRoomResponseImplCopyWithImpl(
      _$CreateChatRoomResponseImpl _value,
      $Res Function(_$CreateChatRoomResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateChatRoomResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? roomName = null,
  }) {
    return _then(_$CreateChatRoomResponseImpl(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int,
      roomName: null == roomName
          ? _value.roomName
          : roomName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateChatRoomResponseImpl implements _CreateChatRoomResponse {
  const _$CreateChatRoomResponseImpl(
      {required this.roomId, required this.roomName});

  factory _$CreateChatRoomResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateChatRoomResponseImplFromJson(json);

  @override
  final int roomId;
  @override
  final String roomName;

  @override
  String toString() {
    return 'CreateChatRoomResponse(roomId: $roomId, roomName: $roomName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateChatRoomResponseImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.roomName, roomName) ||
                other.roomName == roomName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, roomId, roomName);

  /// Create a copy of CreateChatRoomResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateChatRoomResponseImplCopyWith<_$CreateChatRoomResponseImpl>
      get copyWith => __$$CreateChatRoomResponseImplCopyWithImpl<
          _$CreateChatRoomResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateChatRoomResponseImplToJson(
      this,
    );
  }
}

abstract class _CreateChatRoomResponse implements CreateChatRoomResponse {
  const factory _CreateChatRoomResponse(
      {required final int roomId,
      required final String roomName}) = _$CreateChatRoomResponseImpl;

  factory _CreateChatRoomResponse.fromJson(Map<String, dynamic> json) =
      _$CreateChatRoomResponseImpl.fromJson;

  @override
  int get roomId;
  @override
  String get roomName;

  /// Create a copy of CreateChatRoomResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateChatRoomResponseImplCopyWith<_$CreateChatRoomResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
