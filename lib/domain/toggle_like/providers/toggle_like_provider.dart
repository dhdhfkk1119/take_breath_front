import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/utils/base_state.dart';
import 'package:take_breath/domain/toggle_like/models/like_response.dart';
import 'package:take_breath/domain/toggle_like/repositories/toggle_like_repository.dart';

final toggleLikeProvider =
    NotifierProvider<ToggleLikeProvider, BaseState<LikeResponse>>(
  () => ToggleLikeProvider(),
);

class ToggleLikeProvider extends Notifier<BaseState<LikeResponse>> {
  final ToggleLikeRepository _repository = ToggleLikeRepository();

  @override
  BaseState<LikeResponse> build() {
    return const BaseState<LikeResponse>(
      isLoading: false,
      error: null,
      data: null,
    );
  }

  Future<LikeResponse> toggleLike(int postId) async {
    state = state.loading();
    try {
      final isLiked = await _repository.toggleLike(postId);
      state = state.success(isLiked);
      return isLiked;
    } catch (e) {
      state = state.failure(e.toString());
      throw Exception(e);
    }
  }
}
