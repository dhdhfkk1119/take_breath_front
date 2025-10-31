import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/counselor/repositories/counselor_repository.dart';
import 'package:take_breath/domain/member/repositories/member_repository.dart';

final counselorRepositoryProvider = Provider((ref) {
  return CounselorRepository();
});
