import 'package:portone_flutter/model/payment_data.dart';

class PortoneService {
  static const String userCode = 'imp70734377'; // 포트원 가맹점 식별코드

  static PaymentData createPayment({
    required String merchantUid,
    required int amount,
    required String orderName,
    required String buyerName,
    required String buyerEmail,
    required String buyerTel,
  }) {
    return PaymentData(
      pg: 'html5_inicis',           // PG사
      payMethod: 'card',             // 결제수단
      name: orderName,               // 주문명
      merchantUid: merchantUid,      // 주문번호
      amount: amount,                // 결제금액
      buyerName: buyerName,          // 구매자 이름
      buyerTel: buyerTel,            // 구매자 연락처
      buyerEmail: buyerEmail,        // 구매자 이메일
      buyerAddr: '',                 // 구매자 주소
      buyerPostcode: '',             // 구매자 우편번호
      appScheme: 'take_breath',      // 앱 URL scheme
      cardQuota: [],                 // 할부개월수 (빈 배열 = 일시불만)

    );
  }
}