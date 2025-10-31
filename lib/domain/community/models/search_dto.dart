import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_dto.freezed.dart';
part 'search_dto.g.dart';

enum CommunityPostSortType {
  LATEST, // 최신순
  LIKES, // 인기순
  VIEWS, // 조회순
}

@freezed
class SearchDto with _$SearchDto {
  const factory SearchDto({
    String? keyword,
    @Default([]) List<int> categoryIds,
    @Default(CommunityPostSortType.LATEST) CommunityPostSortType sortType,
  }) = _SearchDto;

  factory SearchDto.fromJson(Map<String, dynamic> json) =>
      _$SearchDtoFromJson(json);
}
