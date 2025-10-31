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
      thumbnail: json['thumbnail'] as String,
      likeCount: (json['likeCount'] as num).toInt(),
      viewCount: (json['viewCount'] as num).toInt(),
      commentCount: (json['commentCount'] as num).toInt(),
      createdAt: json['createdAt'] as String,
      isModified: json['isModified'] as bool,
      liked: json['liked'] as bool,
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
      'likeCount': instance.likeCount,
      'viewCount': instance.viewCount,
      'commentCount': instance.commentCount,
      'createdAt': instance.createdAt,
      'isModified': instance.isModified,
      'liked': instance.liked,
    };
