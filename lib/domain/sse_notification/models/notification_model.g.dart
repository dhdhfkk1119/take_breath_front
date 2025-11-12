// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationModelImpl(
      id: (json['id'] as num).toInt(),
      content: json['content'] as String,
      senderName: json['senderName'] as String,
      receiverName: json['receiverName'] as String,
      notificationType:
          $enumDecode(_$NotificationTypeEnumMap, json['notificationType']),
      relatedId: (json['relatedId'] as num).toInt(),
      read: json['read'] as bool? ?? false,
      profileImageUrl: json['profileImageUrl'] as String?,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'senderName': instance.senderName,
      'receiverName': instance.receiverName,
      'notificationType': _$NotificationTypeEnumMap[instance.notificationType]!,
      'relatedId': instance.relatedId,
      'read': instance.read,
      'profileImageUrl': instance.profileImageUrl,
      'createdAt': instance.createdAt,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.COMMENT: 'COMMENT',
  NotificationType.POST_LIKE: 'POST_LIKE',
  NotificationType.SYSTEM: 'SYSTEM',
};
