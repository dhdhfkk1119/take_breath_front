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
      postId: (json['postId'] as num).toInt(),
      postTitle: json['postTitle'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String? ?? "",
      modified: json['modified'] as bool? ?? false,
      deleted: json['deleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$CommunityCommentResponseImplToJson(
        _$CommunityCommentResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'memberId': instance.memberId,
      'memberName': instance.memberName,
      'postId': instance.postId,
      'postTitle': instance.postTitle,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'modified': instance.modified,
      'deleted': instance.deleted,
    };
