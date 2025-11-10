import 'package:take_breath/_core/utils/api_service.dart';
import 'package:take_breath/_core/utils/my_http.dart';
import 'package:take_breath/_core/utils/page_request.dart';
import 'package:take_breath/domain/counselor/models/counselor_response.dart';
import 'package:take_breath/domain/counselor/models/counselor_sign.dart';
import 'package:take_breath/domain/member/services/auth_storage.dart';

class CounselorRepository {
  final ApiService apiService;

  CounselorRepository({required this.apiService});

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

  Future<PageResponse<CounselorResponse>> findAll({
    int page = 0,
    int size = 10,
  }) async {
    try {
      final response = await dio.get(
        '/counselors',
        queryParameters: {'page': page, 'size': size},
      );

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data; // 백엔드 JSON 구조에 맞게 조정
        return PageResponse.fromJson(
          data,
          (json) => CounselorResponse.fromJson(json),
        );
      } else {
        print("상담사 리스트 : ${response.data}");
        throw Exception('API 오류: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('findAll() 오류: $e');
    }
  }

  Future<CounselorResponse> getCounselorById(int id) async {
    final data = await apiService.get("/counselors/$id", queryParameters: {});
    return CounselorResponse.fromJson(data);
  }

  Future<void> toggleLike(int counselorId) async {
    final memberId = AuthStorage.getUserInfo();
    await dio.post(
      "/counselors/$counselorId",
      queryParameters: {'memberId': memberId},
    );
  }
}
