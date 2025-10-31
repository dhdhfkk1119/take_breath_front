import 'package:take_breath/_core/utils/my_http.dart';
import 'package:take_breath/domain/counselor/models/counselor_sign.dart';

class CounselorRepository {
  // 상담사 회원가입
  Future<void> counselorSign(CounselorSign counselorSign) async {
    final List<Map<String, dynamic>> agreementsJson =
        counselorSign.agreements.map((req) => req.toJson()).toList();

    final List<Map<String, dynamic>> licensesJson =
        counselorSign.licenses.map((req) => req.toJson()).toList();

    try {
      final response = await dio.post("/counselors/signup", data: {
        "email": counselorSign.email,
        "password": counselorSign.password,
        "confirmPassword": counselorSign.confirmPassword,
        "name": counselorSign.name,
        "phone": counselorSign.phone,
        "address": counselorSign.address,
        "agreements": agreementsJson,
        "specialty": counselorSign.specialty,
        "introduction": counselorSign.introduction,
        "gender": counselorSign.gender,
        "profileImage": counselorSign.profileImage,
        "hashtags": counselorSign.hashtags,
        "price": counselorSign.price,
        "licenses": licensesJson,
      });

      if (response.statusCode == 200) {
        print("회원가입 성공" + response.data);
      } else {
        throw new Exception("상담사 회원가입 실패: ${response.statusCode}");
      }
    } catch (e) {
      throw new Exception("서버가 연결되어 있지 않습니다: $e");
    }
  }
}
