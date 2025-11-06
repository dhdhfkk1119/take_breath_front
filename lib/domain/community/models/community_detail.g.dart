// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommunityDetailImpl _$$CommunityDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$CommunityDetailImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
      memberId: (json['memberId'] as num?)?.toInt(),
      memberName: json['memberName'] as String?,
      categoryName: json['categoryName'] as String?,
      categoryId: (json['categoryId'] as num?)?.toInt(),
      likeCount: (json['likeCount'] as num?)?.toInt() ?? 0,
      viewCount: (json['viewCount'] as num?)?.toInt() ?? 0,
      commentCount: (json['commentCount'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      isModified: json['modified'] as bool,
      liked: json['liked'] as bool? ?? false,
      imageUrls: (json['imageUrls'] as List<dynamic>?)
              ?.map((e) => CommunityImage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      comments: (json['comments'] as List<dynamic>?)
              ?.map((e) =>
                  CommunityCommentResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CommunityDetailImplToJson(
        _$CommunityDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'memberId': instance.memberId,
      'memberName': instance.memberName,
      'categoryName': instance.categoryName,
      'categoryId': instance.categoryId,
      'likeCount': instance.likeCount,
      'viewCount': instance.viewCount,
      'commentCount': instance.commentCount,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'modified': instance.isModified,
      'liked': instance.liked,
      'imageUrls': instance.imageUrls,
      'comments': instance.comments,
    };
