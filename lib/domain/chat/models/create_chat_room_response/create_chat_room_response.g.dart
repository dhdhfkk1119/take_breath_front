// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_chat_room_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateChatRoomResponseImpl _$$CreateChatRoomResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateChatRoomResponseImpl(
      roomId: (json['roomId'] as num).toInt(),
      roomName: json['roomName'] as String,
    );

Map<String, dynamic> _$$CreateChatRoomResponseImplToJson(
        _$CreateChatRoomResponseImpl instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'roomName': instance.roomName,
    };
