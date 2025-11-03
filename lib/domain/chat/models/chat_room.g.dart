// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatRoomImpl _$$ChatRoomImplFromJson(Map<String, dynamic> json) =>
    _$ChatRoomImpl(
      roomId: (json['roomId'] as num).toInt(),
      roomName: json['roomName'] as String,
      unreadCount: (json['unreadCount'] as num).toInt(),
      lastMessage: json['lastMessage'] as String,
      lastMessageTime: json['lastMessageTime'] as String,
      otherMemberId: (json['otherMemberId'] as num).toInt(),
      otherMemberName: json['otherMemberName'] as String,
    );

Map<String, dynamic> _$$ChatRoomImplToJson(_$ChatRoomImpl instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'roomName': instance.roomName,
      'unreadCount': instance.unreadCount,
      'lastMessage': instance.lastMessage,
      'lastMessageTime': instance.lastMessageTime,
      'otherMemberId': instance.otherMemberId,
      'otherMemberName': instance.otherMemberName,
    };
