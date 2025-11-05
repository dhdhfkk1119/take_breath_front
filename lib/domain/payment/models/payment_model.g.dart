// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentPrepareImpl _$$PaymentPrepareImplFromJson(Map<String, dynamic> json) =>
    _$PaymentPrepareImpl(
      merchantUid: json['merchantUid'] as String,
      amount: (json['amount'] as num).toInt(),
      pointAmount: (json['pointAmount'] as num).toInt(),
      feeAmount: (json['feeAmount'] as num).toInt(),
      orderName: json['orderName'] as String,
      buyerName: json['buyerName'] as String,
      buyerEmail: json['buyerEmail'] as String,
      buyerTel: json['buyerTel'] as String,
    );

Map<String, dynamic> _$$PaymentPrepareImplToJson(
        _$PaymentPrepareImpl instance) =>
    <String, dynamic>{
      'merchantUid': instance.merchantUid,
      'amount': instance.amount,
      'pointAmount': instance.pointAmount,
      'feeAmount': instance.feeAmount,
      'orderName': instance.orderName,
      'buyerName': instance.buyerName,
      'buyerEmail': instance.buyerEmail,
      'buyerTel': instance.buyerTel,
    };

_$PaymentVerifyImpl _$$PaymentVerifyImplFromJson(Map<String, dynamic> json) =>
    _$PaymentVerifyImpl(
      impUid: json['impUid'] as String,
      merchantUid: json['merchantUid'] as String,
    );

Map<String, dynamic> _$$PaymentVerifyImplToJson(_$PaymentVerifyImpl instance) =>
    <String, dynamic>{
      'impUid': instance.impUid,
      'merchantUid': instance.merchantUid,
    };

_$PaymentResultImpl _$$PaymentResultImplFromJson(Map<String, dynamic> json) =>
    _$PaymentResultImpl(
      id: (json['id'] as num).toInt(),
      impUid: json['impUid'] as String,
      merchantUid: json['merchantUid'] as String,
      amount: (json['amount'] as num).toInt(),
      pointAmount: (json['pointAmount'] as num).toInt(),
      feeAmount: (json['feeAmount'] as num).toInt(),
      feeRate: (json['feeRate'] as num).toDouble(),
      status: json['status'] as String,
      payMethod: json['payMethod'] as String,
      orderName: json['orderName'] as String,
      createdAt: json['createdAt'] as String,
      paidAt: json['paidAt'] as String?,
    );

Map<String, dynamic> _$$PaymentResultImplToJson(_$PaymentResultImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'impUid': instance.impUid,
      'merchantUid': instance.merchantUid,
      'amount': instance.amount,
      'pointAmount': instance.pointAmount,
      'feeAmount': instance.feeAmount,
      'feeRate': instance.feeRate,
      'status': instance.status,
      'payMethod': instance.payMethod,
      'orderName': instance.orderName,
      'createdAt': instance.createdAt,
      'paidAt': instance.paidAt,
    };
