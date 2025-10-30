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

  Future<Term> getListTerms() async {
    try {
      final response = await dio.get("/terms");
      if (response.statusCode == 200) {
        return Term.fromJson(response.data);
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
}
