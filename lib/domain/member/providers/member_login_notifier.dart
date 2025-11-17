import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/utils/my_http.dart';
import 'package:take_breath/domain/member/models/member.dart';
import 'package:take_breath/domain/member/repositories/member_repository.dart';
import 'package:take_breath/domain/member/services/auth_storage.dart';
import 'package:take_breath/domain/sse_notification/service/connect_sse.dart';
import 'member_repository_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  // 소셜 로그인
  Future<bool> socialLoginUser(BuildContext context, String provider) async {
    try {
      Member? member;

      if (provider == "google") {
        member = await _googleLogin();
      } else if (provider == "naver") {
        member = await _naverLogin();
      } else {
        throw Exception("지원하지 않는 소셜 로그인 제공자: $provider");
      }

      if (member != null) {
        // 토큰 저장
        await AuthStorage.saveTokens(
            member.accessToken, member.refreshToken ?? "");
        await AuthStorage.saveUserInfo(member);

        // FCM 등록
        final fcmToken = await FirebaseMessaging.instance.getToken();
        if (fcmToken != null) {
          print("소셜 FCM 토큰 전달 : $fcmToken");
          await dio.post("/members/fcm-token", data: {"fcmToken": fcmToken});
        }

        state = member;
        connectSSE();
        print('$provider 소셜 로그인 완료!');
        return true;
      } else {
        print("서버에서 사용자 정보를 가져오지 못함");
        return false;
      }
    } catch (e) {
      print('$provider 소셜 로그인 중 오류 발생: $e');
      return false;
    }
  }

// ================= Google 로그인 로직 =================
  Future<Member?> _googleLogin() async {
    final GoogleSignIn googleSignIn = GoogleSignIn.instance;
    await googleSignIn.initialize();

    const List<String> scopes = ['email', 'profile'];
    final GoogleSignInAccount? googleUser =
        await googleSignIn.authenticate(scopeHint: scopes);

    if (googleUser == null) {
      print('Google sign-in aborted by user.');
      return null;
    }

    final GoogleSignInClientAuthorization authz =
        await googleUser.authorizationClient.authorizeScopes(scopes);

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final String? idToken = googleAuth.idToken;
    if (idToken == null) throw Exception("Google ID Token 획득 실패");

    final credential = GoogleAuthProvider.credential(
      idToken: idToken,
      accessToken: authz.accessToken,
    );

    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final firebaseIdToken = await userCredential.user?.getIdToken(true);

    if (firebaseIdToken == null) throw Exception("Firebase ID Token 획득 실패");

    return await memberRepository.socialLogin(firebaseIdToken, "google");
  }

  // ================= Naver 로그인 로직 =================
  Future<Member?> _naverLogin() async {
    try {
      final NaverLoginResult result = await FlutterNaverLogin.logIn();
      if (result.status == NaverLoginStatus.loggedIn) {
        final token = await FlutterNaverLogin.currentAccessToken;
        if (token != null && token.isValid()) {
          final String accessToken = token.accessToken;
          // 서버로 보내서 Member 받아오기
          return await memberRepository.socialLogin(accessToken, "naver");
        }
      }
      throw Exception("Naver 로그인 실패");
    } catch (e) {
      print("Naver 로그인 오류: $e");
      throw Exception("Naver 로그인 토큰 획득 실패");
    }
  }

  // 로그인
  Future<void> loginUser(String email, String password, bool autoLogin) async {
    final member = await memberRepository.login(email, password, autoLogin);

    // member가 null이 아니라면 데이터를 저장함
    if (member != null) {
      await AuthStorage.saveUserInfo(member);

      // FCM 토큰 가져오기
      final fcmToken = await FirebaseMessaging.instance.getToken();

      if (fcmToken != null) {
        print("일반 로그인 FCM 토큰 전달 : ${fcmToken}");
        await dio.post(
          "/members/fcm-token",
          data: {"fcmToken": fcmToken},
        );
      }
    }

    if (autoLogin) {
      await AuthStorage.saveUserInfo(member);
    } else {
      await AuthStorage.saveTokens(
          member.accessToken, member.refreshToken ?? "");
    }

    state = member; // 상태 갱신
    connectSSE();
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
