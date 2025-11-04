// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_comment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommunityCommentResponseImpl _$$CommunityCommentResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CommunityCommentResponseImpl(
      id: (json['id'] as num).toInt(),
      content: json['content'] as String,
      memberId: (json['memberId'] as num).toInt(),
      memberName: json['memberName'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      deleted: json['deleted'] as bool,
      modified: json['modified'] as bool,
    );

Map<String, dynamic> _$$CommunityCommentResponseImplToJson(
        _$CommunityCommentResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'memberId': instance.memberId,
      'memberName': instance.memberName,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deleted': instance.deleted,
      'modified': instance.modified,
    };
