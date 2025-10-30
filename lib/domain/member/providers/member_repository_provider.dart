import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/member/repositories/member_repository.dart';

final memberRepositoryProvider = Provider((ref) {
  return MemberRepository();
});
