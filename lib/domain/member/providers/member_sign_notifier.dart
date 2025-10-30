import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/member/models/email.dart';
import 'package:take_breath/domain/member/models/is_email_check.dart';
import 'package:take_breath/domain/member/models/member.dart';
import 'package:take_breath/domain/member/repositories/member_repository.dart';
import 'package:take_breath/domain/member/services/auth_storage.dart';

import 'member_repository_provider.dart';

final memberSignProvider =
    NotifierProvider<MemberSignNotifier, Member?>(MemberSignNotifier.new);

class MemberSignNotifier extends Notifier<Member?> {
  late final MemberRepository memberRepository;

  @override
  Member? build() {
    memberRepository = ref.read(memberRepositoryProvider);
    return null;
  }

  // 이메일 중복 체크
  Future<IsEmailCheck> isEmailCheck(String email) async {
    return await memberRepository.isEmailCheck(email);
  }

  // 이메일 인증 보내기
  Future<void> sendCode(String email) async {
    await memberRepository.sendCode(Email(email: email, code: ""));
  }

  // 이메일 코드 검사
  Future<bool> verifyCode(Email email) async {
    return await memberRepository.verifyCode(email);
  }
}
