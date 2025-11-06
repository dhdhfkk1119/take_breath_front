import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/community/models/community_detail.dart';

import 'community_repository_provider.dart';

final communityDetailProvider =
    AsyncNotifierProvider<CommunityDetailNotifier, CommunityDetail?>(
  () => CommunityDetailNotifier(),
);

class CommunityDetailNotifier extends AsyncNotifier<CommunityDetail?> {
  @override
  Future<CommunityDetail?> build() async {
    return null;
  }

  Future<void> fetchDetail(int id) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(communityRepositoryProvider);
      final response = await repository.getDetail(id);
      state = AsyncValue.data(response);
    } catch (s, st) {
      state = AsyncValue.error(s, st);
    }
  }

  Future<String> deletePost(int id) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(communityRepositoryProvider);
      final resultMessage = await repository.deletePost(id);
      state = const AsyncValue.data(null);
      return resultMessage;
    } catch (s) {
      return throw Exception("삭제중 오류 발생 ${s}");
    }
  }
}
