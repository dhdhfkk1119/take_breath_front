import 'package:dio/dio.dart';
import 'package:take_breath/_core/utils/my_http.dart';
import 'package:take_breath/domain/payment/models/payment_model.dart';

class PaymentRepository {
  Future<PaymentPrepare> prepare({
    required int amount,
    required String orderName,
    required String buyerName,
    required String buyerEmail,
    required String buyerTel,
  }) async {
    try {
      final response = await dio.post(
        "/payments/prepare",
        data: {
          "amount": amount,
          "orderName": orderName,
          "buyerName": buyerName,
          "buyerEmail": buyerEmail,
          "buyerTel": buyerTel,
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        return PaymentPrepare.fromJson(response.data['response']);
      } else {
        throw Exception("결제 준비 실패: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("서버가 연결되어 있지 않습니다: $e");
    }
  }

  Future<PaymentResult> verify({
    required String impUid,
    required String merchantUid,
  }) async {
    try {
      final response = await dio.post(
        "/payments/verify",
        data: {
          "impUid": impUid,
          "merchantUid": merchantUid,
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        return PaymentResult.fromJson(response.data['response']);
      } else {
        throw Exception("결제 검증 실패: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("서버가 연결되어 있지 않습니다: $e");
    }
  }
}