import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/utils/base_state.dart';
import 'package:take_breath/domain/counselor/repositories/counselor_repository.dart';

import 'counselor_repository_provider.dart';

final counselorLikeProvider =
    NotifierProvider<CounselorLikeNotifier, BaseState<void>>(
  () => CounselorLikeNotifier(),
);

class CounselorLikeNotifier extends Notifier<BaseState<void>> {
  late final CounselorRepository counselorRepository;

  @override
  build() {
    counselorRepository = ref.read(counselorRepositoryProvider);
    return BaseState<void>.initial();
  }

  Future<void> toggleLike(int counselorId) async {
    state = state.loading();
    try {
      final isLiked = await counselorRepository.toggleLike(counselorId);
      state = state.success(isLiked);
      return isLiked;
    } catch (e) {
      state = state.failure(e.toString());
      throw Exception(e);
    }
  }
}
