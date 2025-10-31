import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/community/models/community_list.dart';
import 'community_repository_provider.dart';
import 'search_dto_provider.dart';

class CommunityListNotifier extends AsyncNotifier<List<CommunityList>> {
  int _currentPage = 0;
  bool _hasNextPage = true;
  bool _isLoading = false;

  @override
  Future<List<CommunityList>> build() async {
    return _fetchPosts(reset: true);
  }

  Future<List<CommunityList>> _fetchPosts({bool reset = false}) async {
    final repository = ref.read(communityRepositoryProvider);
    final searchDto = ref.read(searchDtoProvider);

    if (reset) {
      _currentPage = 0;
      _hasNextPage = true;
    }

    if (_isLoading) return state.value ?? [];
    _isLoading = true;

    final response = await repository.getList(
      searchDto: searchDto,
      page: _currentPage,
      size: 10,
    );

    final newPosts = response.content;
    _hasNextPage = !response.last;

    if (!_hasNextPage) {
      print("마지막 페이지 도달: ${_currentPage}");
    } else {
      _currentPage++;
    }

    final previous = reset ? <CommunityList>[] : (state.value ?? []);
    final combined = [...previous, ...newPosts];

    _isLoading = false;
    return combined;
  }

  Future<void> loadMore() async {
    if (!_hasNextPage || _isLoading) return;

    state = AsyncValue.data(await _fetchPosts());
  }

  Future<void> refreshList() async {
    state = const AsyncValue.loading();
    state = AsyncValue.data(await _fetchPosts(reset: true));
  }
}

final communityListProvider =
    AsyncNotifierProvider<CommunityListNotifier, List<CommunityList>>(
        () => CommunityListNotifier());
