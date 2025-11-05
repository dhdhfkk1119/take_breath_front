// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentPrepare _$PaymentPrepareFromJson(Map<String, dynamic> json) {
  return _PaymentPrepare.fromJson(json);
}

/// @nodoc
mixin _$PaymentPrepare {
  String get merchantUid => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  int get pointAmount => throw _privateConstructorUsedError;
  int get feeAmount => throw _privateConstructorUsedError;
  String get orderName => throw _privateConstructorUsedError;
  String get buyerName => throw _privateConstructorUsedError;
  String get buyerEmail => throw _privateConstructorUsedError;
  String get buyerTel => throw _privateConstructorUsedError;

  /// Serializes this PaymentPrepare to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentPrepare
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentPrepareCopyWith<PaymentPrepare> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentPrepareCopyWith<$Res> {
  factory $PaymentPrepareCopyWith(
          PaymentPrepare value, $Res Function(PaymentPrepare) then) =
      _$PaymentPrepareCopyWithImpl<$Res, PaymentPrepare>;
  @useResult
  $Res call(
      {String merchantUid,
      int amount,
      int pointAmount,
      int feeAmount,
      String orderName,
      String buyerName,
      String buyerEmail,
      String buyerTel});
}

/// @nodoc
class _$PaymentPrepareCopyWithImpl<$Res, $Val extends PaymentPrepare>
    implements $PaymentPrepareCopyWith<$Res> {
  _$PaymentPrepareCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentPrepare
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? merchantUid = null,
    Object? amount = null,
    Object? pointAmount = null,
    Object? feeAmount = null,
    Object? orderName = null,
    Object? buyerName = null,
    Object? buyerEmail = null,
    Object? buyerTel = null,
  }) {
    return _then(_value.copyWith(
      merchantUid: null == merchantUid
          ? _value.merchantUid
          : merchantUid // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      pointAmount: null == pointAmount
          ? _value.pointAmount
          : pointAmount // ignore: cast_nullable_to_non_nullable
              as int,
      feeAmount: null == feeAmount
          ? _value.feeAmount
          : feeAmount // ignore: cast_nullable_to_non_nullable
              as int,
      orderName: null == orderName
          ? _value.orderName
          : orderName // ignore: cast_nullable_to_non_nullable
              as String,
      buyerName: null == buyerName
          ? _value.buyerName
          : buyerName // ignore: cast_nullable_to_non_nullable
              as String,
      buyerEmail: null == buyerEmail
          ? _value.buyerEmail
          : buyerEmail // ignore: cast_nullable_to_non_nullable
              as String,
      buyerTel: null == buyerTel
          ? _value.buyerTel
          : buyerTel // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentPrepareImplCopyWith<$Res>
    implements $PaymentPrepareCopyWith<$Res> {
  factory _$$PaymentPrepareImplCopyWith(_$PaymentPrepareImpl value,
          $Res Function(_$PaymentPrepareImpl) then) =
      __$$PaymentPrepareImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String merchantUid,
      int amount,
      int pointAmount,
      int feeAmount,
      String orderName,
      String buyerName,
      String buyerEmail,
      String buyerTel});
}

/// @nodoc
class __$$PaymentPrepareImplCopyWithImpl<$Res>
    extends _$PaymentPrepareCopyWithImpl<$Res, _$PaymentPrepareImpl>
    implements _$$PaymentPrepareImplCopyWith<$Res> {
  __$$PaymentPrepareImplCopyWithImpl(
      _$PaymentPrepareImpl _value, $Res Function(_$PaymentPrepareImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentPrepare
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? merchantUid = null,
    Object? amount = null,
    Object? pointAmount = null,
    Object? feeAmount = null,
    Object? orderName = null,
    Object? buyerName = null,
    Object? buyerEmail = null,
    Object? buyerTel = null,
  }) {
    return _then(_$PaymentPrepareImpl(
      merchantUid: null == merchantUid
          ? _value.merchantUid
          : merchantUid // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      pointAmount: null == pointAmount
          ? _value.pointAmount
          : pointAmount // ignore: cast_nullable_to_non_nullable
              as int,
      feeAmount: null == feeAmount
          ? _value.feeAmount
          : feeAmount // ignore: cast_nullable_to_non_nullable
              as int,
      orderName: null == orderName
          ? _value.orderName
          : orderName // ignore: cast_nullable_to_non_nullable
              as String,
      buyerName: null == buyerName
          ? _value.buyerName
          : buyerName // ignore: cast_nullable_to_non_nullable
              as String,
      buyerEmail: null == buyerEmail
          ? _value.buyerEmail
          : buyerEmail // ignore: cast_nullable_to_non_nullable
              as String,
      buyerTel: null == buyerTel
          ? _value.buyerTel
          : buyerTel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentPrepareImpl implements _PaymentPrepare {
  const _$PaymentPrepareImpl(
      {required this.merchantUid,
      required this.amount,
      required this.pointAmount,
      required this.feeAmount,
      required this.orderName,
      required this.buyerName,
      required this.buyerEmail,
      required this.buyerTel});

  factory _$PaymentPrepareImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentPrepareImplFromJson(json);

  @override
  final String merchantUid;
  @override
  final int amount;
  @override
  final int pointAmount;
  @override
  final int feeAmount;
  @override
  final String orderName;
  @override
  final String buyerName;
  @override
  final String buyerEmail;
  @override
  final String buyerTel;

  @override
  String toString() {
    return 'PaymentPrepare(merchantUid: $merchantUid, amount: $amount, pointAmount: $pointAmount, feeAmount: $feeAmount, orderName: $orderName, buyerName: $buyerName, buyerEmail: $buyerEmail, buyerTel: $buyerTel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentPrepareImpl &&
            (identical(other.merchantUid, merchantUid) ||
                other.merchantUid == merchantUid) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.pointAmount, pointAmount) ||
                other.pointAmount == pointAmount) &&
            (identical(other.feeAmount, feeAmount) ||
                other.feeAmount == feeAmount) &&
            (identical(other.orderName, orderName) ||
                other.orderName == orderName) &&
            (identical(other.buyerName, buyerName) ||
                other.buyerName == buyerName) &&
            (identical(other.buyerEmail, buyerEmail) ||
                other.buyerEmail == buyerEmail) &&
            (identical(other.buyerTel, buyerTel) ||
                other.buyerTel == buyerTel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, merchantUid, amount, pointAmount,
      feeAmount, orderName, buyerName, buyerEmail, buyerTel);

  /// Create a copy of PaymentPrepare
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentPrepareImplCopyWith<_$PaymentPrepareImpl> get copyWith =>
      __$$PaymentPrepareImplCopyWithImpl<_$PaymentPrepareImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentPrepareImplToJson(
      this,
    );
  }
}

abstract class _PaymentPrepare implements PaymentPrepare {
  const factory _PaymentPrepare(
      {required final String merchantUid,
      required final int amount,
      required final int pointAmount,
      required final int feeAmount,
      required final String orderName,
      required final String buyerName,
      required final String buyerEmail,
      required final String buyerTel}) = _$PaymentPrepareImpl;

  factory _PaymentPrepare.fromJson(Map<String, dynamic> json) =
      _$PaymentPrepareImpl.fromJson;

  @override
  String get merchantUid;
  @override
  int get amount;
  @override
  int get pointAmount;
  @override
  int get feeAmount;
  @override
  String get orderName;
  @override
  String get buyerName;
  @override
  String get buyerEmail;
  @override
  String get buyerTel;

  /// Create a copy of PaymentPrepare
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentPrepareImplCopyWith<_$PaymentPrepareImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentVerify _$PaymentVerifyFromJson(Map<String, dynamic> json) {
  return _PaymentVerify.fromJson(json);
}

/// @nodoc
mixin _$PaymentVerify {
  String get impUid => throw _privateConstructorUsedError;
  String get merchantUid => throw _privateConstructorUsedError;

  /// Serializes this PaymentVerify to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentVerify
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentVerifyCopyWith<PaymentVerify> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentVerifyCopyWith<$Res> {
  factory $PaymentVerifyCopyWith(
          PaymentVerify value, $Res Function(PaymentVerify) then) =
      _$PaymentVerifyCopyWithImpl<$Res, PaymentVerify>;
  @useResult
  $Res call({String impUid, String merchantUid});
}

/// @nodoc
class _$PaymentVerifyCopyWithImpl<$Res, $Val extends PaymentVerify>
    implements $PaymentVerifyCopyWith<$Res> {
  _$PaymentVerifyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentVerify
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? impUid = null,
    Object? merchantUid = null,
  }) {
    return _then(_value.copyWith(
      impUid: null == impUid
          ? _value.impUid
          : impUid // ignore: cast_nullable_to_non_nullable
              as String,
      merchantUid: null == merchantUid
          ? _value.merchantUid
          : merchantUid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentVerifyImplCopyWith<$Res>
    implements $PaymentVerifyCopyWith<$Res> {
  factory _$$PaymentVerifyImplCopyWith(
          _$PaymentVerifyImpl value, $Res Function(_$PaymentVerifyImpl) then) =
      __$$PaymentVerifyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String impUid, String merchantUid});
}

/// @nodoc
class __$$PaymentVerifyImplCopyWithImpl<$Res>
    extends _$PaymentVerifyCopyWithImpl<$Res, _$PaymentVerifyImpl>
    implements _$$PaymentVerifyImplCopyWith<$Res> {
  __$$PaymentVerifyImplCopyWithImpl(
      _$PaymentVerifyImpl _value, $Res Function(_$PaymentVerifyImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentVerify
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? impUid = null,
    Object? merchantUid = null,
  }) {
    return _then(_$PaymentVerifyImpl(
      impUid: null == impUid
          ? _value.impUid
          : impUid // ignore: cast_nullable_to_non_nullable
              as String,
      merchantUid: null == merchantUid
          ? _value.merchantUid
          : merchantUid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentVerifyImpl implements _PaymentVerify {
  const _$PaymentVerifyImpl({required this.impUid, required this.merchantUid});

  factory _$PaymentVerifyImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentVerifyImplFromJson(json);

  @override
  final String impUid;
  @override
  final String merchantUid;

  @override
  String toString() {
    return 'PaymentVerify(impUid: $impUid, merchantUid: $merchantUid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentVerifyImpl &&
            (identical(other.impUid, impUid) || other.impUid == impUid) &&
            (identical(other.merchantUid, merchantUid) ||
                other.merchantUid == merchantUid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, impUid, merchantUid);

  /// Create a copy of PaymentVerify
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentVerifyImplCopyWith<_$PaymentVerifyImpl> get copyWith =>
      __$$PaymentVerifyImplCopyWithImpl<_$PaymentVerifyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentVerifyImplToJson(
      this,
    );
  }
}

abstract class _PaymentVerify implements PaymentVerify {
  const factory _PaymentVerify(
      {required final String impUid,
      required final String merchantUid}) = _$PaymentVerifyImpl;

  factory _PaymentVerify.fromJson(Map<String, dynamic> json) =
      _$PaymentVerifyImpl.fromJson;

  @override
  String get impUid;
  @override
  String get merchantUid;

  /// Create a copy of PaymentVerify
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentVerifyImplCopyWith<_$PaymentVerifyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentResult _$PaymentResultFromJson(Map<String, dynamic> json) {
  return _PaymentResult.fromJson(json);
}

/// @nodoc
mixin _$PaymentResult {
  int get id => throw _privateConstructorUsedError;
  String get impUid => throw _privateConstructorUsedError;
  String get merchantUid => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  int get pointAmount => throw _privateConstructorUsedError;
  int get feeAmount => throw _privateConstructorUsedError;
  double get feeRate => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get payMethod => throw _privateConstructorUsedError;
  String get orderName => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String? get paidAt => throw _privateConstructorUsedError;

  /// Serializes this PaymentResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentResultCopyWith<PaymentResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentResultCopyWith<$Res> {
  factory $PaymentResultCopyWith(
          PaymentResult value, $Res Function(PaymentResult) then) =
      _$PaymentResultCopyWithImpl<$Res, PaymentResult>;
  @useResult
  $Res call(
      {int id,
      String impUid,
      String merchantUid,
      int amount,
      int pointAmount,
      int feeAmount,
      double feeRate,
      String status,
      String payMethod,
      String orderName,
      String createdAt,
      String? paidAt});
}

/// @nodoc
class _$PaymentResultCopyWithImpl<$Res, $Val extends PaymentResult>
    implements $PaymentResultCopyWith<$Res> {
  _$PaymentResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? impUid = null,
    Object? merchantUid = null,
    Object? amount = null,
    Object? pointAmount = null,
    Object? feeAmount = null,
    Object? feeRate = null,
    Object? status = null,
    Object? payMethod = null,
    Object? orderName = null,
    Object? createdAt = null,
    Object? paidAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      impUid: null == impUid
          ? _value.impUid
          : impUid // ignore: cast_nullable_to_non_nullable
              as String,
      merchantUid: null == merchantUid
          ? _value.merchantUid
          : merchantUid // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      pointAmount: null == pointAmount
          ? _value.pointAmount
          : pointAmount // ignore: cast_nullable_to_non_nullable
              as int,
      feeAmount: null == feeAmount
          ? _value.feeAmount
          : feeAmount // ignore: cast_nullable_to_non_nullable
              as int,
      feeRate: null == feeRate
          ? _value.feeRate
          : feeRate // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      payMethod: null == payMethod
          ? _value.payMethod
          : payMethod // ignore: cast_nullable_to_non_nullable
              as String,
      orderName: null == orderName
          ? _value.orderName
          : orderName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      paidAt: freezed == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentResultImplCopyWith<$Res>
    implements $PaymentResultCopyWith<$Res> {
  factory _$$PaymentResultImplCopyWith(
          _$PaymentResultImpl value, $Res Function(_$PaymentResultImpl) then) =
      __$$PaymentResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String impUid,
      String merchantUid,
      int amount,
      int pointAmount,
      int feeAmount,
      double feeRate,
      String status,
      String payMethod,
      String orderName,
      String createdAt,
      String? paidAt});
}

/// @nodoc
class __$$PaymentResultImplCopyWithImpl<$Res>
    extends _$PaymentResultCopyWithImpl<$Res, _$PaymentResultImpl>
    implements _$$PaymentResultImplCopyWith<$Res> {
  __$$PaymentResultImplCopyWithImpl(
      _$PaymentResultImpl _value, $Res Function(_$PaymentResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? impUid = null,
    Object? merchantUid = null,
    Object? amount = null,
    Object? pointAmount = null,
    Object? feeAmount = null,
    Object? feeRate = null,
    Object? status = null,
    Object? payMethod = null,
    Object? orderName = null,
    Object? createdAt = null,
    Object? paidAt = freezed,
  }) {
    return _then(_$PaymentResultImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      impUid: null == impUid
          ? _value.impUid
          : impUid // ignore: cast_nullable_to_non_nullable
              as String,
      merchantUid: null == merchantUid
          ? _value.merchantUid
          : merchantUid // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      pointAmount: null == pointAmount
          ? _value.pointAmount
          : pointAmount // ignore: cast_nullable_to_non_nullable
              as int,
      feeAmount: null == feeAmount
          ? _value.feeAmount
          : feeAmount // ignore: cast_nullable_to_non_nullable
              as int,
      feeRate: null == feeRate
          ? _value.feeRate
          : feeRate // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      payMethod: null == payMethod
          ? _value.payMethod
          : payMethod // ignore: cast_nullable_to_non_nullable
              as String,
      orderName: null == orderName
          ? _value.orderName
          : orderName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      paidAt: freezed == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentResultImpl implements _PaymentResult {
  const _$PaymentResultImpl(
      {required this.id,
      required this.impUid,
      required this.merchantUid,
      required this.amount,
      required this.pointAmount,
      required this.feeAmount,
      required this.feeRate,
      required this.status,
      required this.payMethod,
      required this.orderName,
      required this.createdAt,
      this.paidAt});

  factory _$PaymentResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentResultImplFromJson(json);

  @override
  final int id;
  @override
  final String impUid;
  @override
  final String merchantUid;
  @override
  final int amount;
  @override
  final int pointAmount;
  @override
  final int feeAmount;
  @override
  final double feeRate;
  @override
  final String status;
  @override
  final String payMethod;
  @override
  final String orderName;
  @override
  final String createdAt;
  @override
  final String? paidAt;

  @override
  String toString() {
    return 'PaymentResult(id: $id, impUid: $impUid, merchantUid: $merchantUid, amount: $amount, pointAmount: $pointAmount, feeAmount: $feeAmount, feeRate: $feeRate, status: $status, payMethod: $payMethod, orderName: $orderName, createdAt: $createdAt, paidAt: $paidAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentResultImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.impUid, impUid) || other.impUid == impUid) &&
            (identical(other.merchantUid, merchantUid) ||
                other.merchantUid == merchantUid) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.pointAmount, pointAmount) ||
                other.pointAmount == pointAmount) &&
            (identical(other.feeAmount, feeAmount) ||
                other.feeAmount == feeAmount) &&
            (identical(other.feeRate, feeRate) || other.feeRate == feeRate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.payMethod, payMethod) ||
                other.payMethod == payMethod) &&
            (identical(other.orderName, orderName) ||
                other.orderName == orderName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.paidAt, paidAt) || other.paidAt == paidAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      impUid,
      merchantUid,
      amount,
      pointAmount,
      feeAmount,
      feeRate,
      status,
      payMethod,
      orderName,
      createdAt,
      paidAt);

  /// Create a copy of PaymentResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentResultImplCopyWith<_$PaymentResultImpl> get copyWith =>
      __$$PaymentResultImplCopyWithImpl<_$PaymentResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentResultImplToJson(
      this,
    );
  }
}

abstract class _PaymentResult implements PaymentResult {
  const factory _PaymentResult(
      {required final int id,
      required final String impUid,
      required final String merchantUid,
      required final int amount,
      required final int pointAmount,
      required final int feeAmount,
      required final double feeRate,
      required final String status,
      required final String payMethod,
      required final String orderName,
      required final String createdAt,
      final String? paidAt}) = _$PaymentResultImpl;

  factory _PaymentResult.fromJson(Map<String, dynamic> json) =
      _$PaymentResultImpl.fromJson;

  @override
  int get id;
  @override
  String get impUid;
  @override
  String get merchantUid;
  @override
  int get amount;
  @override
  int get pointAmount;
  @override
  int get feeAmount;
  @override
  double get feeRate;
  @override
  String get status;
  @override
  String get payMethod;
  @override
  String get orderName;
  @override
  String get createdAt;
  @override
  String? get paidAt;

  /// Create a copy of PaymentResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentResultImplCopyWith<_$PaymentResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
