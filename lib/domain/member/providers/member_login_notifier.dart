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
  Future<bool> socialLoginUser(BuildContext context) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;
      await googleSignIn.initialize();

      const List<String> scopes = ['email', 'profile'];
      final GoogleSignInAccount? googleUser =
          await googleSignIn.authenticate(scopeHint: scopes);

      if (googleUser == null) {
        print('Google sign-in aborted by user.');
        return false;
      }

      final GoogleSignInClientAuthorization authz =
          await googleUser.authorizationClient.authorizeScopes(scopes);

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final String? accessToken = authz.accessToken;
      final String? idToken = googleAuth.idToken;

      if (accessToken == null) {
        throw Exception("Google accessToken 획득 실패");
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: accessToken,
        idToken: idToken,
      );

      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final firebaseIdToken = await userCredential.user?.getIdToken(true);

      if (firebaseIdToken == null) {
        throw Exception("Firebase ID Token 획득 실패");
      }

      final member =
          await memberRepository.socialLogin(firebaseIdToken, 'google');

      if (member != null) {
        await AuthStorage.saveTokens(
            member.accessToken, member.refreshToken ?? "");
        await AuthStorage.saveUserInfo(member);

        // 로그인시 fcm 코드 등록
        final fcmToken = await FirebaseMessaging.instance.getToken();
        if (fcmToken != null) {
          print("소셜 FCM 토큰 전달 : ${fcmToken}");
          await dio.post(
            "/members/fcm-token",
            data: {"fcmToken": fcmToken},
          );
        }

        state = member;
        connectSSE();
        print('소셜 로그인 완료!');
        return true;
      } else {
        print("서버에서 사용자 정보를 가져오지 못함");
        return false;
      }
    } catch (e) {
      print('소셜 로그인 중 오류 발생: $e');
      return false;
    }
  }

  Future<bool?> naverLogin(BuildContext context) async {
    try {
      final NaverLoginResult res = await FlutterNaverLogin.logIn();

      // 로그인 성공 확인
      if (res.status == NaverLoginStatus.loggedIn) {
        final NaverAccessToken token =
            await FlutterNaverLogin.currentAccessToken;
        final member = await memberRepository.socialNaverLogin(
            token.accessToken, // String 값
            'naver');

        if (member != null) {
          await AuthStorage.saveTokens(
              member.accessToken, member.refreshToken ?? "");
          await AuthStorage.saveUserInfo(member);

          // 로그인시 fcm 코드 등록
          final fcmToken = await FirebaseMessaging.instance.getToken();
          if (fcmToken != null) {
            print("소셜 FCM 토큰 전달 : ${fcmToken}");
            await dio.post(
              "/members/fcm-token",
              data: {"fcmToken": fcmToken},
            );
          }

          state = member;
          connectSSE();
          print('소셜 로그인 완료!');
          return true;
        } else {
          print("서버에서 사용자 정보를 가져오지 못함");
          return false;
        }
      } else {
        print("네이버 로그인 실패: ${res.status}");
        return false;
      }
    } catch (error) {
      print('Login failed: $error');
      return false;
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
