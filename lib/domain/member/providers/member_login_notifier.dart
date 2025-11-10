import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/member/models/is_email_check.dart';
import 'package:take_breath/domain/member/models/member.dart';
import 'package:take_breath/domain/member/repositories/member_repository.dart';
import 'package:take_breath/domain/member/services/auth_storage.dart';
import 'package:take_breath/domain/sse_notification/service/connect_sse.dart';

import 'member_repository_provider.dart';

final memberProvider =
    NotifierProvider<MemberNotifier, Member?>(MemberNotifier.new);

class MemberNotifier extends Notifier<Member?> {
  late final MemberRepository memberRepository;

  @override
  Member? build() {
    memberRepository = ref.read(memberRepositoryProvider);
    tryAutoLogin();
    return null;
  }

  // 로그인
  Future<void> loginUser(String email, String password, bool autoLogin) async {
    final member = await memberRepository.login(email, password, autoLogin);

    // member가 null이 아니라면 데이터를 저장함
    if(member != null) {
      await AuthStorage.saveUserInfo(member);
    }

    if (autoLogin) {
      await AuthStorage.saveUserInfo(member);
    } else {
      await AuthStorage.saveTokens(member.accessToken, member.refreshToken ?? "");
    }

    state = member; // 상태 갱신
    connectSSE(member.id);
  }

  // 자동 로그인 시도
  Future<void> tryAutoLogin() async {
    final savedMember = await AuthStorage.getUserInfo();
    if (savedMember != null && savedMember.accessToken.isNotEmpty) {
      state = savedMember;
    }
  }

  // 회원정보 재조회
  Future<void> fetchMemberInfo() async {
    try {
      final member = await memberRepository.getMemberInfo();
      state = member;
      await AuthStorage.saveUserInfo(member);
    } catch (e) {
      print("회원정보 조회 실패: $e");
    }
  }

  // 로그아웃
  Future<void> logout() async {
    await AuthStorage.clear();
    state = null;
  }
}
