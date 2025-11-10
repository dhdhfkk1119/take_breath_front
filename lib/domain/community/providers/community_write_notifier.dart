import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/community/models/community_update.dart';
import 'package:take_breath/domain/community/models/community_write.dart';
import 'package:take_breath/domain/community/providers/community_repository_provider.dart';
import 'package:take_breath/domain/community/repositories/community_repository.dart';

final communityWriteProvider = NotifierProvider<CommunityWriteNotifier, void>(
  () => CommunityWriteNotifier(),
);

class CommunityWriteNotifier extends Notifier<void> {
  late final CommunityRepository communityRepository;

  bool isLoading = false;
  String? error;

  @override
  void build() {
    communityRepository = ref.read(communityRepositoryProvider);
  }

  Future<void> save(CommunityWrite communityWrite) async {
    isLoading = true;
    error = null;
    state = null;

    try {
      await communityRepository.save(communityWrite);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      state = null; // 상태 갱신 트리거
    }
  }

  Future<void> update(CommunityUpdate communityUpdate, int id) async {
    isLoading = true;
    error = null;
    state = null;

    try {
      await communityRepository.update(communityUpdate, id);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      state = null; // 상태 갱신 트리거
    }
  }
}
