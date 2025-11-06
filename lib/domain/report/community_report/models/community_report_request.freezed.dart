// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_report_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CommunityReportRequest {
  String get reason => throw _privateConstructorUsedError;

  /// Create a copy of CommunityReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommunityReportRequestCopyWith<CommunityReportRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunityReportRequestCopyWith<$Res> {
  factory $CommunityReportRequestCopyWith(CommunityReportRequest value,
          $Res Function(CommunityReportRequest) then) =
      _$CommunityReportRequestCopyWithImpl<$Res, CommunityReportRequest>;
  @useResult
  $Res call({String reason});
}

/// @nodoc
class _$CommunityReportRequestCopyWithImpl<$Res,
        $Val extends CommunityReportRequest>
    implements $CommunityReportRequestCopyWith<$Res> {
  _$CommunityReportRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommunityReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
  }) {
    return _then(_value.copyWith(
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommunityReportRequestImplCopyWith<$Res>
    implements $CommunityReportRequestCopyWith<$Res> {
  factory _$$CommunityReportRequestImplCopyWith(
          _$CommunityReportRequestImpl value,
          $Res Function(_$CommunityReportRequestImpl) then) =
      __$$CommunityReportRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String reason});
}

/// @nodoc
class __$$CommunityReportRequestImplCopyWithImpl<$Res>
    extends _$CommunityReportRequestCopyWithImpl<$Res,
        _$CommunityReportRequestImpl>
    implements _$$CommunityReportRequestImplCopyWith<$Res> {
  __$$CommunityReportRequestImplCopyWithImpl(
      _$CommunityReportRequestImpl _value,
      $Res Function(_$CommunityReportRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommunityReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
  }) {
    return _then(_$CommunityReportRequestImpl(
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CommunityReportRequestImpl implements _CommunityReportRequest {
  const _$CommunityReportRequestImpl({required this.reason});

  @override
  final String reason;

  @override
  String toString() {
    return 'CommunityReportRequest(reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunityReportRequestImpl &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reason);

  /// Create a copy of CommunityReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunityReportRequestImplCopyWith<_$CommunityReportRequestImpl>
      get copyWith => __$$CommunityReportRequestImplCopyWithImpl<
          _$CommunityReportRequestImpl>(this, _$identity);
}

abstract class _CommunityReportRequest implements CommunityReportRequest {
  const factory _CommunityReportRequest({required final String reason}) =
      _$CommunityReportRequestImpl;

  @override
  String get reason;

  /// Create a copy of CommunityReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommunityReportRequestImplCopyWith<_$CommunityReportRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
