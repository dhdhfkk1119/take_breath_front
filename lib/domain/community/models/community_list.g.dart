// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommunityListImpl _$$CommunityListImplFromJson(Map<String, dynamic> json) =>
    _$CommunityListImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      memberId: (json['memberId'] as num).toInt(),
      memberName: json['memberName'] as String,
      categoryId: (json['categoryId'] as num).toInt(),
      categoryName: json['categoryName'] as String,
      preview: json['preview'] as String,
      thumbnail: json['thumbnail'] as String? ?? "",
      liked: json['liked'] as bool? ?? false,
      modified: json['modified'] as bool? ?? false,
      likeCount: (json['likeCount'] as num?)?.toInt() ?? 0,
      commentCount: (json['commentCount'] as num?)?.toInt() ?? 0,
      viewCount: (json['viewCount'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$CommunityListImplToJson(_$CommunityListImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'memberId': instance.memberId,
      'memberName': instance.memberName,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'preview': instance.preview,
      'thumbnail': instance.thumbnail,
      'liked': instance.liked,
      'modified': instance.modified,
      'likeCount': instance.likeCount,
      'commentCount': instance.commentCount,
      'viewCount': instance.viewCount,
      'createdAt': instance.createdAt,
    };
