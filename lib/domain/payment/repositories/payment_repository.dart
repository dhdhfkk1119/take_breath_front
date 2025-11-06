
import 'package:take_breath/_core/utils/api_service.dart';
import 'package:take_breath/domain/payment/models/payment_model.dart';

class PaymentRepository {
  final ApiService _api;

  PaymentRepository(this._api);

  // 결제 준비
  Future<PaymentPrepare> prepare({
    required int amount,
    required String orderName,
    required String buyerName,
    required String buyerEmail,
    required String buyerTel,
  }) async {
    final data = await _api.post('/payments/prepare', {
      'amount': amount,
      'orderName': orderName,
      'buyerName': buyerName,
      'buyerEmail': buyerEmail,
      'buyerTel': buyerTel,
    });

    print('결제 준비 성공: $data');
    return PaymentPrepare.fromJson(data);
  }

  // 결제 검증
  Future<PaymentResult> verify({
    required String impUid,
    required String merchantUid,
  }) async {
    final data = await _api.post('/payments/verify', {
      'impUid': impUid,
      'merchantUid': merchantUid,
    });

    print('결제 검증 성공: $data');
    return PaymentResult.fromJson(data);
  }

  // 결제+환불 통합 내역 조회 (페이징)
  Future<List<PaymentHistory>> getPaymentHistory({
    int page = 0,
    int size = 10,
  }) async {
    final data = await _api.get(
      '/payments/mine',
      queryParameters: {'page': page, 'size': size},
    );

    final List<dynamic> payments = data['content'];
    return payments.map((json) => PaymentHistory.fromJson(json)).toList();
  }

  // 환불 요청
  Future<void> requestRefund({
    required int paymentId,
    required String reason,
  }) async {
    await _api.post('/refunds', {
      'paymentId': paymentId,
      'reason': reason,
    });
  }
}
