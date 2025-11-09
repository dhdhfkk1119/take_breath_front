import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_model.freezed.dart';
part 'payment_model.g.dart';

// 결제 준비 응답
@freezed
class PaymentPrepare with _$PaymentPrepare {
  const factory PaymentPrepare({
    required String merchantUid,
    required int amount,
    required int pointAmount,
    required int feeAmount,
    required String orderName,
    required String buyerName,
    required String buyerEmail,
    required String buyerTel,
  }) = _PaymentPrepare;

  factory PaymentPrepare.fromJson(Map<String, dynamic> json) =>
      _$PaymentPrepareFromJson(json);
}

// 결제 검증
@freezed
class PaymentVerify with _$PaymentVerify {
  const factory PaymentVerify({
    required String impUid,
    required String merchantUid,
  }) = _PaymentVerify;

  factory PaymentVerify.fromJson(Map<String, dynamic> json) =>
      _$PaymentVerifyFromJson(json);
}

// 결제 결과
@freezed
class PaymentResult with _$PaymentResult {
  const factory PaymentResult({
    required int id,
    required String impUid,
    required String merchantUid,
    required int amount,
    required int pointAmount,
    required int feeAmount,
    required double feeRate,
    required String status,
    required String payMethod,
    required String orderName,
    required String createdAt,
    String? paidAt,
  }) = _PaymentResult;

  factory PaymentResult.fromJson(Map<String, dynamic> json) =>
      _$PaymentResultFromJson(json);
}

// 결제+환불 통합 내역
@freezed
class PaymentHistory with _$PaymentHistory {
  const factory PaymentHistory({
    // 결제 정보
    required int id,
    required String impUid,
    required String merchantUid,
    required int amount,
    required int pointAmount,
    required int feeAmount,
    required double feeRate,
    required String status,
    required String payMethod,
    required String orderName,
    required String createdAt,
    String? paidAt,

    // 환불 정보
    int? refundId,
    int? refundAmount,
    String? refundStatus,
    String? refundedAt,

    // 환불 가능 여부
    required bool canRefund,
    required int daysUntilRefundExpiry,
  }) = _PaymentHistory;

  factory PaymentHistory.fromJson(Map<String, dynamic> json) =>
      _$PaymentHistoryFromJson(json);
}
