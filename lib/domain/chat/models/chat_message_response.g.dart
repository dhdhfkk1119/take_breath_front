// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatMessageResponseImpl _$$ChatMessageResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatMessageResponseImpl(
      messageId: (json['messageId'] as num).toInt(),
      senderId: (json['senderId'] as num).toInt(),
      senderName: json['senderName'] as String,
      content: json['content'] as String,
      messageType: json['messageType'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      isRead: json['isRead'] as bool,
      imageUrl: json['imageUrl'] as String?,
      currentPoint: json['currentPoint'] as String?,
    );

Map<String, dynamic> _$$ChatMessageResponseImplToJson(
        _$ChatMessageResponseImpl instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'senderId': instance.senderId,
      'senderName': instance.senderName,
      'content': instance.content,
      'messageType': instance.messageType,
      'createdAt': instance.createdAt.toIso8601String(),
      'isRead': instance.isRead,
      'imageUrl': instance.imageUrl,
      'currentPoint': instance.currentPoint,
    };
