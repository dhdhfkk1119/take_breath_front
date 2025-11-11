import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/community_comment_repository.dart';

final communityCommentRepositoryProvider =
    Provider<CommunityCommentRepository>((ref) {
  return CommunityCommentRepository();
});
