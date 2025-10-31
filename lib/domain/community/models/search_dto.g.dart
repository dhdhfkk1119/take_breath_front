// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchDtoImpl _$$SearchDtoImplFromJson(Map<String, dynamic> json) =>
    _$SearchDtoImpl(
      keyword: json['keyword'] as String?,
      categoryIds: (json['categoryIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      sortType: $enumDecodeNullable(
              _$CommunityPostSortTypeEnumMap, json['sortType']) ??
          CommunityPostSortType.LATEST,
    );

Map<String, dynamic> _$$SearchDtoImplToJson(_$SearchDtoImpl instance) =>
    <String, dynamic>{
      'keyword': instance.keyword,
      'categoryIds': instance.categoryIds,
      'sortType': _$CommunityPostSortTypeEnumMap[instance.sortType]!,
    };

const _$CommunityPostSortTypeEnumMap = {
  CommunityPostSortType.LATEST: 'LATEST',
  CommunityPostSortType.LIKES: 'LIKES',
  CommunityPostSortType.VIEWS: 'VIEWS',
};
