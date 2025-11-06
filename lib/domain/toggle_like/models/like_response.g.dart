// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LikeResponseImpl _$$LikeResponseImplFromJson(Map<String, dynamic> json) =>
    _$LikeResponseImpl(
      liked: json['liked'] as bool,
      likeCount: (json['likeCount'] as num).toInt(),
    );

Map<String, dynamic> _$$LikeResponseImplToJson(_$LikeResponseImpl instance) =>
    <String, dynamic>{
      'liked': instance.liked,
      'likeCount': instance.likeCount,
    };
