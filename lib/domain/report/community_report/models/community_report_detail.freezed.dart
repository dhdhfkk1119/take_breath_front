// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_report_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommentReportDetailDTO _$CommentReportDetailDTOFromJson(
    Map<String, dynamic> json) {
  return _CommentReportDetailDTO.fromJson(json);
}

/// @nodoc
mixin _$CommentReportDetailDTO {
  int get id => throw _privateConstructorUsedError;
  int get reporterId => throw _privateConstructorUsedError;
  String get reporterName => throw _privateConstructorUsedError;
  int get postId => throw _privateConstructorUsedError;
  String get postTitle => throw _privateConstructorUsedError;
  String get postContent => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  CommunityReportStatus get status => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  List<AdminComment> get adminComments => throw _privateConstructorUsedError;

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
      int postId,
      String postTitle,
      String postContent,
      String reason,
      CommunityReportStatus status,
      String createdAt,
      List<AdminComment> adminComments});
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
    Object? postId = null,
    Object? postTitle = null,
    Object? postContent = null,
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
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      postTitle: null == postTitle
          ? _value.postTitle
          : postTitle // ignore: cast_nullable_to_non_nullable
              as String,
      postContent: null == postContent
          ? _value.postContent
          : postContent // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommunityReportStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      adminComments: null == adminComments
          ? _value.adminComments
          : adminComments // ignore: cast_nullable_to_non_nullable
              as List<AdminComment>,
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
      int postId,
      String postTitle,
      String postContent,
      String reason,
      CommunityReportStatus status,
      String createdAt,
      List<AdminComment> adminComments});
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
    Object? postId = null,
    Object? postTitle = null,
    Object? postContent = null,
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
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      postTitle: null == postTitle
          ? _value.postTitle
          : postTitle // ignore: cast_nullable_to_non_nullable
              as String,
      postContent: null == postContent
          ? _value.postContent
          : postContent // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommunityReportStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      adminComments: null == adminComments
          ? _value._adminComments
          : adminComments // ignore: cast_nullable_to_non_nullable
              as List<AdminComment>,
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
      required this.postId,
      required this.postTitle,
      required this.postContent,
      required this.reason,
      this.status = CommunityReportStatus.PENDING,
      required this.createdAt,
      final List<AdminComment> adminComments = const []})
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
  final int postId;
  @override
  final String postTitle;
  @override
  final String postContent;
  @override
  final String reason;
  @override
  @JsonKey()
  final CommunityReportStatus status;
  @override
  final String createdAt;
  final List<AdminComment> _adminComments;
  @override
  @JsonKey()
  List<AdminComment> get adminComments {
    if (_adminComments is EqualUnmodifiableListView) return _adminComments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_adminComments);
  }

  @override
  String toString() {
    return 'CommentReportDetailDTO(id: $id, reporterId: $reporterId, reporterName: $reporterName, postId: $postId, postTitle: $postTitle, postContent: $postContent, reason: $reason, status: $status, createdAt: $createdAt, adminComments: $adminComments)';
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
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.postTitle, postTitle) ||
                other.postTitle == postTitle) &&
            (identical(other.postContent, postContent) ||
                other.postContent == postContent) &&
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
      postId,
      postTitle,
      postContent,
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
      required final int postId,
      required final String postTitle,
      required final String postContent,
      required final String reason,
      final CommunityReportStatus status,
      required final String createdAt,
      final List<AdminComment> adminComments}) = _$CommentReportDetailDTOImpl;

  factory _CommentReportDetailDTO.fromJson(Map<String, dynamic> json) =
      _$CommentReportDetailDTOImpl.fromJson;

  @override
  int get id;
  @override
  int get reporterId;
  @override
  String get reporterName;
  @override
  int get postId;
  @override
  String get postTitle;
  @override
  String get postContent;
  @override
  String get reason;
  @override
  CommunityReportStatus get status;
  @override
  String get createdAt;
  @override
  List<AdminComment> get adminComments;

  /// Create a copy of CommentReportDetailDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentReportDetailDTOImplCopyWith<_$CommentReportDetailDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
