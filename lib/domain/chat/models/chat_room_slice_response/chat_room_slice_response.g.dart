// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_slice_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatRoomSliceResponseImpl _$$ChatRoomSliceResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatRoomSliceResponseImpl(
      content: (json['content'] as List<dynamic>)
          .map((e) => ChatRoomListResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageNumber: (json['pageNumber'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      hasNext: json['hasNext'] as bool,
      isFirst: json['isFirst'] as bool,
      isLast: json['isLast'] as bool,
    );

Map<String, dynamic> _$$ChatRoomSliceResponseImplToJson(
        _$ChatRoomSliceResponseImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'hasNext': instance.hasNext,
      'isFirst': instance.isFirst,
      'isLast': instance.isLast,
    };
