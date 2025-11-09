import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/utils/base_state.dart';
import 'package:take_breath/domain/comment/models/community_comment_request.dart';
import 'package:take_breath/domain/comment/models/community_comment_response.dart';
import 'package:take_breath/domain/comment/repositories/community_comment_repository.dart';

final communityCommentWriteProvider = NotifierProvider<
    CommunityCommentWriteNotifier, BaseState<CommunityCommentResponse>>(
  () => CommunityCommentWriteNotifier(),
);

class CommunityCommentWriteNotifier
    extends Notifier<BaseState<CommunityCommentResponse>> {
  final CommunityCommentRepository communityCommentRepository =
      CommunityCommentRepository();

  @override
  BaseState<CommunityCommentResponse> build() {
    return BaseState<CommunityCommentResponse>.initial();
  }

  Future<CommunityCommentResponse> saveComment(
      int postId, CommunityCommentRequest request) async {
    return await CommunityCommentRepository().saveComment(postId, request);
  }

  Future<void> updateComment(
      int commentId, CommunityCommentRequest request) async {
    await CommunityCommentRepository().updateComment(commentId, request);
  }

  Future<void> findCommentsByPostId(int postId) async {
    state = state.loading();

    try {
      final response =
          await CommunityCommentRepository().findCommentsByPostId(postId);

      state = state.success(response);
    } catch (e) {
      state = state.failure(e.toString());
    }
  }

  Future<String> deleteComment(int commentId) async {
    return await CommunityCommentRepository().deleteComment(commentId);
  }
}
