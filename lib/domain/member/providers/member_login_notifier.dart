import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/member/models/member.dart';
import 'package:take_breath/domain/member/repositories/member_repository.dart';
import 'package:take_breath/domain/member/services/auth_storage.dart';

final memberProvider =
    NotifierProvider<MemberNotifier, Member?>(MemberNotifier.new);

class MemberNotifier extends Notifier<Member?> {
  final memberRepository = MemberRepository();

  @override
  Member? build() {
    tryAutoLogin();
    return null;
  }

  // 로그인
  Future<void> loginUser(String email, String password, bool autoLogin) async {
    final member = await memberRepository.login(email, password, autoLogin);

    if (autoLogin) {
      await AuthStorage.saveUserInfo(member);
    } else {
      await AuthStorage.saveTokens(
          member.accessToken, member.refreshToken ?? "");
    }

    state = member; // 상태 갱신
  }

  // 자동 로그인 시도
  Future<void> tryAutoLogin() async {
    final savedMember = await AuthStorage.getUserInfo();
    if (savedMember != null && savedMember.accessToken.isNotEmpty) {
      state = savedMember;
    }
  }

  // 로그아웃
  Future<void> logout() async {
    await AuthStorage.clear();
    state = null;
  }

  // 이메일 중복 체크
  Future<bool> isEmailCheck(String email) async {
    return await memberRepository.isEmailCheck(email);
  }
}
