import 'package:dio/dio.dart';

class PaymentService {
  final Dio _dio;

  PaymentService({required Dio dio}) : _dio = dio;

  // 결제 성공 후, 백엔드에 검증 요청
  Future<bool> verifyPayment({
    required String impUid,
    required String merchantUid,
  }) async {
    try {
      final response = await _dio.post(
        '/payments/verify',
        data: {
          'imp_uid': impUid,
          'merchant_uid': merchantUid,
        },
      );

      // 백엔드에서 검증 성공 시 true를 반환한다고 가정
      if (response.statusCode == 200 && response.data['success'] == true) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      // 오류 발생 시 결제 실패로 간주
      throw Exception('결제 검증 네트워크 오류: ${e.message}');
    }
  }
}