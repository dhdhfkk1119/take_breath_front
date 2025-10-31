// lib/domain/member/providers/member_sign_notifier.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/member/models/email.dart';
import 'package:take_breath/domain/member/models/is_email_check.dart';
import 'package:take_breath/domain/member/models/member_sign.dart';
import 'package:take_breath/domain/member/models/terms_request.dart';
import 'package:take_breath/domain/member/repositories/member_repository.dart';

import 'member_repository_provider.dart';

final memberSignProvider =
    NotifierProvider<MemberSignNotifier, MemberSign>(MemberSignNotifier.new);

class MemberSignNotifier extends Notifier<MemberSign> {
  late final MemberRepository memberRepository;

  @override
  MemberSign build() {
    memberRepository = ref.read(memberRepositoryProvider);
    return const MemberSign(
      email: '',
      password: '',
      confirmPassword: '',
      name: '',
      phone: '',
      address: '',
    );
  }

  // 회원가입 상태값 저장
  void updateForm({
    String? email,
    String? password,
    String? confirmPassword,
    String? name,
    String? phone,
    String? address,
  }) {
    state = state.copyWith(
      email: email ?? state.email,
      password: password ?? state.password,
      confirmPassword: confirmPassword ?? state.confirmPassword,
      name: name ?? state.name,
      phone: phone ?? state.phone,
      address: address ?? state.address,
    );
  }

  // 약관 상태 값 저장
  void setAgreements(List<TermsRequest> agreements) {
    state = state.copyWith(agreements: agreements);
  }

  Future<void> sign() async {
    await memberRepository.sign(state);
  }

  // 이메일 중복 체크 (기존 유지)
  Future<IsEmailCheck> isEmailCheck(String email) async {
    return await memberRepository.isEmailCheck(email);
  }

  // 이메일 인증 보내기 (기존 유지)
  Future<void> sendCode(String email) async {
    await memberRepository.sendCode(Email(email: email, code: ""));
  }

  // 이메일 코드 검사 (기존 유지)
  Future<bool> verifyCode(Email email) async {
    return await memberRepository.verifyCode(email);
  }
}
