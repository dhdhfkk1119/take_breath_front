// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_report_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommentReportResponse _$CommentReportResponseFromJson(
    Map<String, dynamic> json) {
  return _CommentReportResponse.fromJson(json);
}

/// @nodoc
mixin _$CommentReportResponse {
  List<CommentReportListDTO> get reports => throw _privateConstructorUsedError;

  /// Serializes this CommentReportResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentReportResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentReportResponseCopyWith<CommentReportResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentReportResponseCopyWith<$Res> {
  factory $CommentReportResponseCopyWith(CommentReportResponse value,
          $Res Function(CommentReportResponse) then) =
      _$CommentReportResponseCopyWithImpl<$Res, CommentReportResponse>;
  @useResult
  $Res call({List<CommentReportListDTO> reports});
}

/// @nodoc
class _$CommentReportResponseCopyWithImpl<$Res,
        $Val extends CommentReportResponse>
    implements $CommentReportResponseCopyWith<$Res> {
  _$CommentReportResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentReportResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reports = null,
  }) {
    return _then(_value.copyWith(
      reports: null == reports
          ? _value.reports
          : reports // ignore: cast_nullable_to_non_nullable
              as List<CommentReportListDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentReportResponseImplCopyWith<$Res>
    implements $CommentReportResponseCopyWith<$Res> {
  factory _$$CommentReportResponseImplCopyWith(
          _$CommentReportResponseImpl value,
          $Res Function(_$CommentReportResponseImpl) then) =
      __$$CommentReportResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CommentReportListDTO> reports});
}

/// @nodoc
class __$$CommentReportResponseImplCopyWithImpl<$Res>
    extends _$CommentReportResponseCopyWithImpl<$Res,
        _$CommentReportResponseImpl>
    implements _$$CommentReportResponseImplCopyWith<$Res> {
  __$$CommentReportResponseImplCopyWithImpl(_$CommentReportResponseImpl _value,
      $Res Function(_$CommentReportResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentReportResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reports = null,
  }) {
    return _then(_$CommentReportResponseImpl(
      reports: null == reports
          ? _value._reports
          : reports // ignore: cast_nullable_to_non_nullable
              as List<CommentReportListDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentReportResponseImpl implements _CommentReportResponse {
  const _$CommentReportResponseImpl(
      {required final List<CommentReportListDTO> reports})
      : _reports = reports;

  factory _$CommentReportResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentReportResponseImplFromJson(json);

  final List<CommentReportListDTO> _reports;
  @override
  List<CommentReportListDTO> get reports {
    if (_reports is EqualUnmodifiableListView) return _reports;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reports);
  }

  @override
  String toString() {
    return 'CommentReportResponse(reports: $reports)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentReportResponseImpl &&
            const DeepCollectionEquality().equals(other._reports, _reports));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_reports));

  /// Create a copy of CommentReportResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentReportResponseImplCopyWith<_$CommentReportResponseImpl>
      get copyWith => __$$CommentReportResponseImplCopyWithImpl<
          _$CommentReportResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentReportResponseImplToJson(
      this,
    );
  }
}

abstract class _CommentReportResponse implements CommentReportResponse {
  const factory _CommentReportResponse(
          {required final List<CommentReportListDTO> reports}) =
      _$CommentReportResponseImpl;

  factory _CommentReportResponse.fromJson(Map<String, dynamic> json) =
      _$CommentReportResponseImpl.fromJson;

  @override
  List<CommentReportListDTO> get reports;

  /// Create a copy of CommentReportResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentReportResponseImplCopyWith<_$CommentReportResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CommentReportCreateDTO _$CommentReportCreateDTOFromJson(
    Map<String, dynamic> json) {
  return _CommentReportCreateDTO.fromJson(json);
}

/// @nodoc
mixin _$CommentReportCreateDTO {
  int get id => throw _privateConstructorUsedError;
  int get reporterId => throw _privateConstructorUsedError;
  String get reporterName => throw _privateConstructorUsedError;
  int get commentId => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError; // enum 대신 문자열로 받음
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this CommentReportCreateDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentReportCreateDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentReportCreateDTOCopyWith<CommentReportCreateDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentReportCreateDTOCopyWith<$Res> {
  factory $CommentReportCreateDTOCopyWith(CommentReportCreateDTO value,
          $Res Function(CommentReportCreateDTO) then) =
      _$CommentReportCreateDTOCopyWithImpl<$Res, CommentReportCreateDTO>;
  @useResult
  $Res call(
      {int id,
      int reporterId,
      String reporterName,
      int commentId,
      String reason,
      String message,
      String status,
      String createdAt});
}

/// @nodoc
class _$CommentReportCreateDTOCopyWithImpl<$Res,
        $Val extends CommentReportCreateDTO>
    implements $CommentReportCreateDTOCopyWith<$Res> {
  _$CommentReportCreateDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentReportCreateDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reporterId = null,
    Object? reporterName = null,
    Object? commentId = null,
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
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
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
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentReportCreateDTOImplCopyWith<$Res>
    implements $CommentReportCreateDTOCopyWith<$Res> {
  factory _$$CommentReportCreateDTOImplCopyWith(
          _$CommentReportCreateDTOImpl value,
          $Res Function(_$CommentReportCreateDTOImpl) then) =
      __$$CommentReportCreateDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int reporterId,
      String reporterName,
      int commentId,
      String reason,
      String message,
      String status,
      String createdAt});
}

/// @nodoc
class __$$CommentReportCreateDTOImplCopyWithImpl<$Res>
    extends _$CommentReportCreateDTOCopyWithImpl<$Res,
        _$CommentReportCreateDTOImpl>
    implements _$$CommentReportCreateDTOImplCopyWith<$Res> {
  __$$CommentReportCreateDTOImplCopyWithImpl(
      _$CommentReportCreateDTOImpl _value,
      $Res Function(_$CommentReportCreateDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentReportCreateDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reporterId = null,
    Object? reporterName = null,
    Object? commentId = null,
    Object? reason = null,
    Object? message = null,
    Object? status = null,
    Object? createdAt = null,
  }) {
    return _then(_$CommentReportCreateDTOImpl(
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
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
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
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentReportCreateDTOImpl implements _CommentReportCreateDTO {
  const _$CommentReportCreateDTOImpl(
      {required this.id,
      required this.reporterId,
      required this.reporterName,
      required this.commentId,
      required this.reason,
      required this.message,
      required this.status,
      required this.createdAt});

  factory _$CommentReportCreateDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentReportCreateDTOImplFromJson(json);

  @override
  final int id;
  @override
  final int reporterId;
  @override
  final String reporterName;
  @override
  final int commentId;
  @override
  final String reason;
  @override
  final String message;
  @override
  final String status;
// enum 대신 문자열로 받음
  @override
  final String createdAt;

  @override
  String toString() {
    return 'CommentReportCreateDTO(id: $id, reporterId: $reporterId, reporterName: $reporterName, commentId: $commentId, reason: $reason, message: $message, status: $status, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentReportCreateDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reporterId, reporterId) ||
                other.reporterId == reporterId) &&
            (identical(other.reporterName, reporterName) ||
                other.reporterName == reporterName) &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, reporterId, reporterName,
      commentId, reason, message, status, createdAt);

  /// Create a copy of CommentReportCreateDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentReportCreateDTOImplCopyWith<_$CommentReportCreateDTOImpl>
      get copyWith => __$$CommentReportCreateDTOImplCopyWithImpl<
          _$CommentReportCreateDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentReportCreateDTOImplToJson(
      this,
    );
  }
}

abstract class _CommentReportCreateDTO implements CommentReportCreateDTO {
  const factory _CommentReportCreateDTO(
      {required final int id,
      required final int reporterId,
      required final String reporterName,
      required final int commentId,
      required final String reason,
      required final String message,
      required final String status,
      required final String createdAt}) = _$CommentReportCreateDTOImpl;

  factory _CommentReportCreateDTO.fromJson(Map<String, dynamic> json) =
      _$CommentReportCreateDTOImpl.fromJson;

  @override
  int get id;
  @override
  int get reporterId;
  @override
  String get reporterName;
  @override
  int get commentId;
  @override
  String get reason;
  @override
  String get message;
  @override
  String get status; // enum 대신 문자열로 받음
  @override
  String get createdAt;

  /// Create a copy of CommentReportCreateDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentReportCreateDTOImplCopyWith<_$CommentReportCreateDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CommentReportListDTO _$CommentReportListDTOFromJson(Map<String, dynamic> json) {
  return _CommentReportListDTO.fromJson(json);
}

/// @nodoc
mixin _$CommentReportListDTO {
  int get id => throw _privateConstructorUsedError;
  int get reporterId => throw _privateConstructorUsedError;
  String get reporterName => throw _privateConstructorUsedError;
  int get commentId => throw _privateConstructorUsedError;
  String get commentContent => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this CommentReportListDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentReportListDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentReportListDTOCopyWith<CommentReportListDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentReportListDTOCopyWith<$Res> {
  factory $CommentReportListDTOCopyWith(CommentReportListDTO value,
          $Res Function(CommentReportListDTO) then) =
      _$CommentReportListDTOCopyWithImpl<$Res, CommentReportListDTO>;
  @useResult
  $Res call(
      {int id,
      int reporterId,
      String reporterName,
      int commentId,
      String commentContent,
      String reason,
      String status,
      String createdAt});
}

/// @nodoc
class _$CommentReportListDTOCopyWithImpl<$Res,
        $Val extends CommentReportListDTO>
    implements $CommentReportListDTOCopyWith<$Res> {
  _$CommentReportListDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentReportListDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reporterId = null,
    Object? reporterName = null,
    Object? commentId = null,
    Object? commentContent = null,
    Object? reason = null,
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
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as int,
      commentContent: null == commentContent
          ? _value.commentContent
          : commentContent // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentReportListDTOImplCopyWith<$Res>
    implements $CommentReportListDTOCopyWith<$Res> {
  factory _$$CommentReportListDTOImplCopyWith(_$CommentReportListDTOImpl value,
          $Res Function(_$CommentReportListDTOImpl) then) =
      __$$CommentReportListDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int reporterId,
      String reporterName,
      int commentId,
      String commentContent,
      String reason,
      String status,
      String createdAt});
}

/// @nodoc
class __$$CommentReportListDTOImplCopyWithImpl<$Res>
    extends _$CommentReportListDTOCopyWithImpl<$Res, _$CommentReportListDTOImpl>
    implements _$$CommentReportListDTOImplCopyWith<$Res> {
  __$$CommentReportListDTOImplCopyWithImpl(_$CommentReportListDTOImpl _value,
      $Res Function(_$CommentReportListDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentReportListDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reporterId = null,
    Object? reporterName = null,
    Object? commentId = null,
    Object? commentContent = null,
    Object? reason = null,
    Object? status = null,
    Object? createdAt = null,
  }) {
    return _then(_$CommentReportListDTOImpl(
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
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as int,
      commentContent: null == commentContent
          ? _value.commentContent
          : commentContent // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentReportListDTOImpl implements _CommentReportListDTO {
  const _$CommentReportListDTOImpl(
      {required this.id,
      required this.reporterId,
      required this.reporterName,
      required this.commentId,
      required this.commentContent,
      required this.reason,
      required this.status,
      required this.createdAt});

  factory _$CommentReportListDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentReportListDTOImplFromJson(json);

  @override
  final int id;
  @override
  final int reporterId;
  @override
  final String reporterName;
  @override
  final int commentId;
  @override
  final String commentContent;
  @override
  final String reason;
  @override
  final String status;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'CommentReportListDTO(id: $id, reporterId: $reporterId, reporterName: $reporterName, commentId: $commentId, commentContent: $commentContent, reason: $reason, status: $status, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentReportListDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reporterId, reporterId) ||
                other.reporterId == reporterId) &&
            (identical(other.reporterName, reporterName) ||
                other.reporterName == reporterName) &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            (identical(other.commentContent, commentContent) ||
                other.commentContent == commentContent) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, reporterId, reporterName,
      commentId, commentContent, reason, status, createdAt);

  /// Create a copy of CommentReportListDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentReportListDTOImplCopyWith<_$CommentReportListDTOImpl>
      get copyWith =>
          __$$CommentReportListDTOImplCopyWithImpl<_$CommentReportListDTOImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentReportListDTOImplToJson(
      this,
    );
  }
}

abstract class _CommentReportListDTO implements CommentReportListDTO {
  const factory _CommentReportListDTO(
      {required final int id,
      required final int reporterId,
      required final String reporterName,
      required final int commentId,
      required final String commentContent,
      required final String reason,
      required final String status,
      required final String createdAt}) = _$CommentReportListDTOImpl;

  factory _CommentReportListDTO.fromJson(Map<String, dynamic> json) =
      _$CommentReportListDTOImpl.fromJson;

  @override
  int get id;
  @override
  int get reporterId;
  @override
  String get reporterName;
  @override
  int get commentId;
  @override
  String get commentContent;
  @override
  String get reason;
  @override
  String get status;
  @override
  String get createdAt;

  /// Create a copy of CommentReportListDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentReportListDTOImplCopyWith<_$CommentReportListDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CommentReportDetailDTO _$CommentReportDetailDTOFromJson(
    Map<String, dynamic> json) {
  return _CommentReportDetailDTO.fromJson(json);
}

/// @nodoc
mixin _$CommentReportDetailDTO {
  int get id => throw _privateConstructorUsedError;
  int get reporterId => throw _privateConstructorUsedError;
  String get reporterName => throw _privateConstructorUsedError;
  int get commentId => throw _privateConstructorUsedError;
  String get commentContent => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  List<AdminCommentDTO> get adminComments => throw _privateConstructorUsedError;

  /// Serializes this CommentReportDetailDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentReportDetailDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentReportDetailDTOCopyWith<CommentReportDetailDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentReportDetailDTOCopyWith<$Res> {
  factory $CommentReportDetailDTOCopyWith(CommentReportDetailDTO value,
          $Res Function(CommentReportDetailDTO) then) =
      _$CommentReportDetailDTOCopyWithImpl<$Res, CommentReportDetailDTO>;
  @useResult
  $Res call(
      {int id,
      int reporterId,
      String reporterName,
      int commentId,
      String commentContent,
      String reason,
      String status,
      String createdAt,
      List<AdminCommentDTO> adminComments});
}

/// @nodoc
class _$CommentReportDetailDTOCopyWithImpl<$Res,
        $Val extends CommentReportDetailDTO>
    implements $CommentReportDetailDTOCopyWith<$Res> {
  _$CommentReportDetailDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentReportDetailDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reporterId = null,
    Object? reporterName = null,
    Object? commentId = null,
    Object? commentContent = null,
    Object? reason = null,
    Object? status = null,
    Object? createdAt = null,
    Object? adminComments = null,
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
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as int,
      commentContent: null == commentContent
          ? _value.commentContent
          : commentContent // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      adminComments: null == adminComments
          ? _value.adminComments
          : adminComments // ignore: cast_nullable_to_non_nullable
              as List<AdminCommentDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentReportDetailDTOImplCopyWith<$Res>
    implements $CommentReportDetailDTOCopyWith<$Res> {
  factory _$$CommentReportDetailDTOImplCopyWith(
          _$CommentReportDetailDTOImpl value,
          $Res Function(_$CommentReportDetailDTOImpl) then) =
      __$$CommentReportDetailDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int reporterId,
      String reporterName,
      int commentId,
      String commentContent,
      String reason,
      String status,
      String createdAt,
      List<AdminCommentDTO> adminComments});
}

/// @nodoc
class __$$CommentReportDetailDTOImplCopyWithImpl<$Res>
    extends _$CommentReportDetailDTOCopyWithImpl<$Res,
        _$CommentReportDetailDTOImpl>
    implements _$$CommentReportDetailDTOImplCopyWith<$Res> {
  __$$CommentReportDetailDTOImplCopyWithImpl(
      _$CommentReportDetailDTOImpl _value,
      $Res Function(_$CommentReportDetailDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentReportDetailDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reporterId = null,
    Object? reporterName = null,
    Object? commentId = null,
    Object? commentContent = null,
    Object? reason = null,
    Object? status = null,
    Object? createdAt = null,
    Object? adminComments = null,
  }) {
    return _then(_$CommentReportDetailDTOImpl(
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
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as int,
      commentContent: null == commentContent
          ? _value.commentContent
          : commentContent // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      adminComments: null == adminComments
          ? _value._adminComments
          : adminComments // ignore: cast_nullable_to_non_nullable
              as List<AdminCommentDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentReportDetailDTOImpl implements _CommentReportDetailDTO {
  const _$CommentReportDetailDTOImpl(
      {required this.id,
      required this.reporterId,
      required this.reporterName,
      required this.commentId,
      required this.commentContent,
      required this.reason,
      required this.status,
      required this.createdAt,
      required final List<AdminCommentDTO> adminComments})
      : _adminComments = adminComments;

  factory _$CommentReportDetailDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentReportDetailDTOImplFromJson(json);

  @override
  final int id;
  @override
  final int reporterId;
  @override
  final String reporterName;
  @override
  final int commentId;
  @override
  final String commentContent;
  @override
  final String reason;
  @override
  final String status;
  @override
  final String createdAt;
  final List<AdminCommentDTO> _adminComments;
  @override
  List<AdminCommentDTO> get adminComments {
    if (_adminComments is EqualUnmodifiableListView) return _adminComments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_adminComments);
  }

  @override
  String toString() {
    return 'CommentReportDetailDTO(id: $id, reporterId: $reporterId, reporterName: $reporterName, commentId: $commentId, commentContent: $commentContent, reason: $reason, status: $status, createdAt: $createdAt, adminComments: $adminComments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentReportDetailDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reporterId, reporterId) ||
                other.reporterId == reporterId) &&
            (identical(other.reporterName, reporterName) ||
                other.reporterName == reporterName) &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            (identical(other.commentContent, commentContent) ||
                other.commentContent == commentContent) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality()
                .equals(other._adminComments, _adminComments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      reporterId,
      reporterName,
      commentId,
      commentContent,
      reason,
      status,
      createdAt,
      const DeepCollectionEquality().hash(_adminComments));

  /// Create a copy of CommentReportDetailDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentReportDetailDTOImplCopyWith<_$CommentReportDetailDTOImpl>
      get copyWith => __$$CommentReportDetailDTOImplCopyWithImpl<
          _$CommentReportDetailDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentReportDetailDTOImplToJson(
      this,
    );
  }
}

abstract class _CommentReportDetailDTO implements CommentReportDetailDTO {
  const factory _CommentReportDetailDTO(
          {required final int id,
          required final int reporterId,
          required final String reporterName,
          required final int commentId,
          required final String commentContent,
          required final String reason,
          required final String status,
          required final String createdAt,
          required final List<AdminCommentDTO> adminComments}) =
      _$CommentReportDetailDTOImpl;

  factory _CommentReportDetailDTO.fromJson(Map<String, dynamic> json) =
      _$CommentReportDetailDTOImpl.fromJson;

  @override
  int get id;
  @override
  int get reporterId;
  @override
  String get reporterName;
  @override
  int get commentId;
  @override
  String get commentContent;
  @override
  String get reason;
  @override
  String get status;
  @override
  String get createdAt;
  @override
  List<AdminCommentDTO> get adminComments;

  /// Create a copy of CommentReportDetailDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentReportDetailDTOImplCopyWith<_$CommentReportDetailDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AdminCommentDTO _$AdminCommentDTOFromJson(Map<String, dynamic> json) {
  return _AdminCommentDTO.fromJson(json);
}

/// @nodoc
mixin _$AdminCommentDTO {
  int get id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get adminId => throw _privateConstructorUsedError;
  String get adminName => throw _privateConstructorUsedError;
  String get adminComment => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this AdminCommentDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AdminCommentDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminCommentDTOCopyWith<AdminCommentDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminCommentDTOCopyWith<$Res> {
  factory $AdminCommentDTOCopyWith(
          AdminCommentDTO value, $Res Function(AdminCommentDTO) then) =
      _$AdminCommentDTOCopyWithImpl<$Res, AdminCommentDTO>;
  @useResult
  $Res call(
      {int id,
      String status,
      int adminId,
      String adminName,
      String adminComment,
      String createdAt});
}

/// @nodoc
class _$AdminCommentDTOCopyWithImpl<$Res, $Val extends AdminCommentDTO>
    implements $AdminCommentDTOCopyWith<$Res> {
  _$AdminCommentDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminCommentDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? adminId = null,
    Object? adminName = null,
    Object? adminComment = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      adminId: null == adminId
          ? _value.adminId
          : adminId // ignore: cast_nullable_to_non_nullable
              as int,
      adminName: null == adminName
          ? _value.adminName
          : adminName // ignore: cast_nullable_to_non_nullable
              as String,
      adminComment: null == adminComment
          ? _value.adminComment
          : adminComment // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminCommentDTOImplCopyWith<$Res>
    implements $AdminCommentDTOCopyWith<$Res> {
  factory _$$AdminCommentDTOImplCopyWith(_$AdminCommentDTOImpl value,
          $Res Function(_$AdminCommentDTOImpl) then) =
      __$$AdminCommentDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String status,
      int adminId,
      String adminName,
      String adminComment,
      String createdAt});
}

/// @nodoc
class __$$AdminCommentDTOImplCopyWithImpl<$Res>
    extends _$AdminCommentDTOCopyWithImpl<$Res, _$AdminCommentDTOImpl>
    implements _$$AdminCommentDTOImplCopyWith<$Res> {
  __$$AdminCommentDTOImplCopyWithImpl(
      _$AdminCommentDTOImpl _value, $Res Function(_$AdminCommentDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminCommentDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? adminId = null,
    Object? adminName = null,
    Object? adminComment = null,
    Object? createdAt = null,
  }) {
    return _then(_$AdminCommentDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      adminId: null == adminId
          ? _value.adminId
          : adminId // ignore: cast_nullable_to_non_nullable
              as int,
      adminName: null == adminName
          ? _value.adminName
          : adminName // ignore: cast_nullable_to_non_nullable
              as String,
      adminComment: null == adminComment
          ? _value.adminComment
          : adminComment // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdminCommentDTOImpl implements _AdminCommentDTO {
  const _$AdminCommentDTOImpl(
      {required this.id,
      required this.status,
      required this.adminId,
      required this.adminName,
      required this.adminComment,
      required this.createdAt});

  factory _$AdminCommentDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminCommentDTOImplFromJson(json);

  @override
  final int id;
  @override
  final String status;
  @override
  final int adminId;
  @override
  final String adminName;
  @override
  final String adminComment;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'AdminCommentDTO(id: $id, status: $status, adminId: $adminId, adminName: $adminName, adminComment: $adminComment, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminCommentDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.adminId, adminId) || other.adminId == adminId) &&
            (identical(other.adminName, adminName) ||
                other.adminName == adminName) &&
            (identical(other.adminComment, adminComment) ||
                other.adminComment == adminComment) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, status, adminId, adminName, adminComment, createdAt);

  /// Create a copy of AdminCommentDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminCommentDTOImplCopyWith<_$AdminCommentDTOImpl> get copyWith =>
      __$$AdminCommentDTOImplCopyWithImpl<_$AdminCommentDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminCommentDTOImplToJson(
      this,
    );
  }
}

abstract class _AdminCommentDTO implements AdminCommentDTO {
  const factory _AdminCommentDTO(
      {required final int id,
      required final String status,
      required final int adminId,
      required final String adminName,
      required final String adminComment,
      required final String createdAt}) = _$AdminCommentDTOImpl;

  factory _AdminCommentDTO.fromJson(Map<String, dynamic> json) =
      _$AdminCommentDTOImpl.fromJson;

  @override
  int get id;
  @override
  String get status;
  @override
  int get adminId;
  @override
  String get adminName;
  @override
  String get adminComment;
  @override
  String get createdAt;

  /// Create a copy of AdminCommentDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminCommentDTOImplCopyWith<_$AdminCommentDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
