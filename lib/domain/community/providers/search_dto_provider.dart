import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/community/models/search_dto.dart';

const initialSearchDto = SearchDto(
  keyword: null,
  categoryIds: [],
  sortType: CommunityPostSortType.LATEST,
);

final searchDtoProvider = StateProvider<SearchDto>((ref) {
  return initialSearchDto;
});
