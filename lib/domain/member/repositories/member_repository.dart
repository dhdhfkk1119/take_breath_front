import 'package:dio/dio.dart';
import 'package:take_breath/_core/utils/my_http.dart';
import 'package:take_breath/domain/member/models/member.dart';
import 'package:take_breath/domain/member/models/member_sign.dart';

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

  Future<bool> isEmailCheck(String email) async {
    try {
      final response = await dio.post(
        "/members/check-id/${email}",
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
}
