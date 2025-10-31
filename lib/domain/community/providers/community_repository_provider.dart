import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/community/repositories/community_repository.dart';

final communityRepositoryProvider = Provider<CommunityRepository>((ref) {
  return CommunityRepository();
});
