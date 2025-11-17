import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:take_breath/_core/utils/my_http.dart';
import 'package:take_breath/domain/member/models/email.dart';
import 'package:take_breath/domain/member/models/is_email_check.dart';
import 'package:take_breath/domain/member/models/member.dart';
import 'package:take_breath/domain/member/models/member_sign.dart';
import 'package:take_breath/domain/member/models/term.dart';

class MemberRepository {
  Future<Member> login(String email, String password, bool autoLogin) async {
    try {
      final response = await dio.post(
        "/members/login",
        data: {
          "email": email,
          "password": password,
          "autoLogin": autoLogin,
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        print("로그인 응답: ${response.data}");
        return Member.fromJson(response.data);
      } else {
        throw Exception("로그인 실패: ${response.statusCode}");
      }
    } catch (e, st) {
      throw Exception("서버가 연결되어 있지 않습니다: $e");
    }
  }

  Future<void> sign(MemberSign memberSign) async {
    final List<Map<String, dynamic>> agreementsJson =
        memberSign.agreements.map((req) => req.toJson()).toList();

    try {
      final response = await dio.post(
        "/members/signup",
        data: {
          "email": memberSign.email,
          "password": memberSign.password,
          "confirmPassword": memberSign.confirmPassword,
          "name": memberSign.name,
          "phone": memberSign.phone,
          "address": memberSign.address,
          "role": memberSign.role.name,
          "agreements": agreementsJson,
        },
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("로그인 실패: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("서버가 연결되어 있지 않습니다: $e");
    }
  }

  Future<IsEmailCheck> isEmailCheck(String email) async {
    try {
      final response = await dio.get(
        "/members/check-email/${email}",
      );

      if (response.statusCode == 200) {
        return IsEmailCheck.fromJson(response.data);
      } else {
        throw Exception("로그인 실패: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("서버가 연결되어 있지 않습니다: $e");
    }
  }

  Future<void> sendCode(Email email) async {
    try {
      await dio.post("/emails/verify", data: {
        "email": email.email,
        "code": email.code ?? "",
      });
    } catch (e) {
      throw Exception("서버가 연결 되어있지 않음: $e");
    }
  }

  Future<bool> verifyCode(Email email) async {
    try {
      final response = await dio.post("/emails/verify/check", data: {
        "email": email.email,
        "code": email.code,
      });
      if (response.statusCode == 200) {
        return response.data["emailVerified"];
      } else {
        throw Exception("인증코드 확인 실패: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("서버가 연결 되어있지 않음: $e");
    }
  }

  Future<List<Term>> getListTerms() async {
    try {
      final response = await dio.get("/terms");
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.data as List<dynamic>;

        return jsonList.map((json) => Term.fromJson(json)).toList();
      } else {
        throw Exception("서비스 이용약관 조회 실패: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("서버가 연결 되어있지 않음: $e");
    }
  }

  Future<Term> getTerms(int id) async {
    try {
      final response = await dio.get("/terms/{id}");
      if (response.statusCode == 200) {
        return Term.fromJson(response.data);
      } else {
        throw Exception("서비스 이용약관 조회 실패: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("서버가 연결 되어있지 않음: $e");
    }
  }

// 회원정보 조회
  Future<Member> getMemberInfo() async {
    try {
      final response = await dio.get("/members/info");
      if (response.statusCode == 200) {
        print("회원정보 응답: ${response.data}");
        return Member.fromJson(response.data);
      } else {
        throw Exception("회원정보 조회 실패");
      }
    } catch (e) {
      print("에러 상세: $e");
      throw Exception("서버 연결 실패: $e");
    }
  }

  // 회원정보 수정 (닉네임, 프로필 이미지)
  Future<void> updateProfile({
    required String nickName,
    File? profileImage,
  }) async {
    try {
      final formData = FormData();
      formData.fields.add(MapEntry('nickName', nickName));

      if (profileImage != null) {
        formData.files.add(MapEntry(
          'image',
          await MultipartFile.fromFile(profileImage.path),
        ));
      }

      final response = await dio.patch(
        '/members/update',
        data: formData,
      );

      if (response.statusCode != 200) {
        throw Exception("정보 수정 실패");
      }
    } catch (e) {
      throw Exception("서버 연결 실패: $e");
    }
  }

  Future<Member?> socialLogin(String idToken, String provider) async {
    try {
      final response = await dio.post(
        '/auth/social-login',
        data: jsonEncode({
          'idToken': idToken,
          'provider': provider,
        }),
      );

      if (response.statusCode == 200) {
        final responseBody = response.data;
        final String jwt = responseBody['jwt'];
        final memberJson = responseBody['member'];

        if (responseBody['phone'] == null) {
          responseBody['phone'] = '';
        }
        if (responseBody['daysLeft'] == null) {
          responseBody['daysLeft'] = 0; // 또는 null 유지
        }

        Member member = Member.fromJson(memberJson);
        member = member.copyWith(accessToken: jwt);

        final accessTokenFromHeader =
            response.headers['authorization']?.first?.split(' ').last;

        final String newAccessToken = member.accessToken.isNotEmpty
            ? member.accessToken
            : (accessTokenFromHeader ?? member.accessToken);

        member = member.copyWith(accessToken: newAccessToken);

        return member;
      } else {
        print('소셜 로그인 API 오류: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('소셜 로그인 통신 실패: $e');
      return null;
    }
  }
}
