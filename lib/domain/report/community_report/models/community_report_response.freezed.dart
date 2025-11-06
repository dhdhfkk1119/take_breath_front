// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_report_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommunityReportResponse _$CommunityReportResponseFromJson(
    Map<String, dynamic> json) {
  return _CommunityReportResponse.fromJson(json);
}

/// @nodoc
mixin _$CommunityReportResponse {
  int get id => throw _privateConstructorUsedError;
  int get reporterId => throw _privateConstructorUsedError;
  String get reporterName => throw _privateConstructorUsedError;
  int get postId => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  CommunityReportStatus get status => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this CommunityReportResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommunityReportResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommunityReportResponseCopyWith<CommunityReportResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunityReportResponseCopyWith<$Res> {
  factory $CommunityReportResponseCopyWith(CommunityReportResponse value,
          $Res Function(CommunityReportResponse) then) =
      _$CommunityReportResponseCopyWithImpl<$Res, CommunityReportResponse>;
  @useResult
  $Res call(
      {int id,
      int reporterId,
      String reporterName,
      int postId,
      String reason,
      String message,
      CommunityReportStatus status,
      String createdAt});
}

/// @nodoc
class _$CommunityReportResponseCopyWithImpl<$Res,
        $Val extends CommunityReportResponse>
    implements $CommunityReportResponseCopyWith<$Res> {
  _$CommunityReportResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommunityReportResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reporterId = null,
    Object? reporterName = null,
    Object? postId = null,
    Object? reason = null,
    Object? message = null,
    Object? status = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      reporterId: null == reporterId
          ? _value.reporterId
          : reporterId // ignore: cast_nullable_to_non_nullable
              as int,
      reporterName: null == reporterName
          ? _value.reporterName
          : reporterName // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommunityReportStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommunityReportResponseImplCopyWith<$Res>
    implements $CommunityReportResponseCopyWith<$Res> {
  factory _$$CommunityReportResponseImplCopyWith(
          _$CommunityReportResponseImpl value,
          $Res Function(_$CommunityReportResponseImpl) then) =
      __$$CommunityReportResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int reporterId,
      String reporterName,
      int postId,
      String reason,
      String message,
      CommunityReportStatus status,
      String createdAt});
}

/// @nodoc
class __$$CommunityReportResponseImplCopyWithImpl<$Res>
    extends _$CommunityReportResponseCopyWithImpl<$Res,
        _$CommunityReportResponseImpl>
    implements _$$CommunityReportResponseImplCopyWith<$Res> {
  __$$CommunityReportResponseImplCopyWithImpl(
      _$CommunityReportResponseImpl _value,
      $Res Function(_$CommunityReportResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommunityReportResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reporterId = null,
    Object? reporterName = null,
    Object? postId = null,
    Object? reason = null,
    Object? message = null,
    Object? status = null,
    Object? createdAt = null,
  }) {
    return _then(_$CommunityReportResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      reporterId: null == reporterId
          ? _value.reporterId
          : reporterId // ignore: cast_nullable_to_non_nullable
              as int,
      reporterName: null == reporterName
          ? _value.reporterName
          : reporterName // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommunityReportStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommunityReportResponseImpl implements _CommunityReportResponse {
  const _$CommunityReportResponseImpl(
      {required this.id,
      required this.reporterId,
      required this.reporterName,
      required this.postId,
      required this.reason,
      required this.message,
      this.status = CommunityReportStatus.PENDING,
      required this.createdAt});

  factory _$CommunityReportResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommunityReportResponseImplFromJson(json);

  @override
  final int id;
  @override
  final int reporterId;
  @override
  final String reporterName;
  @override
  final int postId;
  @override
  final String reason;
  @override
  final String message;
  @override
  @JsonKey()
  final CommunityReportStatus status;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'CommunityReportResponse(id: $id, reporterId: $reporterId, reporterName: $reporterName, postId: $postId, reason: $reason, message: $message, status: $status, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunityReportResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reporterId, reporterId) ||
                other.reporterId == reporterId) &&
            (identical(other.reporterName, reporterName) ||
                other.reporterName == reporterName) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, reporterId, reporterName,
      postId, reason, message, status, createdAt);

  /// Create a copy of CommunityReportResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunityReportResponseImplCopyWith<_$CommunityReportResponseImpl>
      get copyWith => __$$CommunityReportResponseImplCopyWithImpl<
          _$CommunityReportResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommunityReportResponseImplToJson(
      this,
    );
  }
}

abstract class _CommunityReportResponse implements CommunityReportResponse {
  const factory _CommunityReportResponse(
      {required final int id,
      required final int reporterId,
      required final String reporterName,
      required final int postId,
      required final String reason,
      required final String message,
      final CommunityReportStatus status,
      required final String createdAt}) = _$CommunityReportResponseImpl;

  factory _CommunityReportResponse.fromJson(Map<String, dynamic> json) =
      _$CommunityReportResponseImpl.fromJson;

  @override
  int get id;
  @override
  int get reporterId;
  @override
  String get reporterName;
  @override
  int get postId;
  @override
  String get reason;
  @override
  String get message;
  @override
  CommunityReportStatus get status;
  @override
  String get createdAt;

  /// Create a copy of CommunityReportResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommunityReportResponseImplCopyWith<_$CommunityReportResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
