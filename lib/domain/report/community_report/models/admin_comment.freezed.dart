// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdminComment _$AdminCommentFromJson(Map<String, dynamic> json) {
  return _AdminComment.fromJson(json);
}

/// @nodoc
mixin _$AdminComment {
  int get id => throw _privateConstructorUsedError;
  CommunityReportStatus get status => throw _privateConstructorUsedError;
  int get adminId => throw _privateConstructorUsedError;
  String get adminName => throw _privateConstructorUsedError;
  String get adminComment => throw _privateConstructorUsedError;
  String get createdAd => throw _privateConstructorUsedError;

  /// Serializes this AdminComment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AdminComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminCommentCopyWith<AdminComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminCommentCopyWith<$Res> {
  factory $AdminCommentCopyWith(
          AdminComment value, $Res Function(AdminComment) then) =
      _$AdminCommentCopyWithImpl<$Res, AdminComment>;
  @useResult
  $Res call(
      {int id,
      CommunityReportStatus status,
      int adminId,
      String adminName,
      String adminComment,
      String createdAd});
}

/// @nodoc
class _$AdminCommentCopyWithImpl<$Res, $Val extends AdminComment>
    implements $AdminCommentCopyWith<$Res> {
  _$AdminCommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? adminId = null,
    Object? adminName = null,
    Object? adminComment = null,
    Object? createdAd = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommunityReportStatus,
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
      createdAd: null == createdAd
          ? _value.createdAd
          : createdAd // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminCommentImplCopyWith<$Res>
    implements $AdminCommentCopyWith<$Res> {
  factory _$$AdminCommentImplCopyWith(
          _$AdminCommentImpl value, $Res Function(_$AdminCommentImpl) then) =
      __$$AdminCommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      CommunityReportStatus status,
      int adminId,
      String adminName,
      String adminComment,
      String createdAd});
}

/// @nodoc
class __$$AdminCommentImplCopyWithImpl<$Res>
    extends _$AdminCommentCopyWithImpl<$Res, _$AdminCommentImpl>
    implements _$$AdminCommentImplCopyWith<$Res> {
  __$$AdminCommentImplCopyWithImpl(
      _$AdminCommentImpl _value, $Res Function(_$AdminCommentImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? adminId = null,
    Object? adminName = null,
    Object? adminComment = null,
    Object? createdAd = null,
  }) {
    return _then(_$AdminCommentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommunityReportStatus,
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
      createdAd: null == createdAd
          ? _value.createdAd
          : createdAd // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdminCommentImpl implements _AdminComment {
  const _$AdminCommentImpl(
      {required this.id,
      required this.status,
      required this.adminId,
      required this.adminName,
      required this.adminComment,
      required this.createdAd});

  factory _$AdminCommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminCommentImplFromJson(json);

  @override
  final int id;
  @override
  final CommunityReportStatus status;
  @override
  final int adminId;
  @override
  final String adminName;
  @override
  final String adminComment;
  @override
  final String createdAd;

  @override
  String toString() {
    return 'AdminComment(id: $id, status: $status, adminId: $adminId, adminName: $adminName, adminComment: $adminComment, createdAd: $createdAd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminCommentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.adminId, adminId) || other.adminId == adminId) &&
            (identical(other.adminName, adminName) ||
                other.adminName == adminName) &&
            (identical(other.adminComment, adminComment) ||
                other.adminComment == adminComment) &&
            (identical(other.createdAd, createdAd) ||
                other.createdAd == createdAd));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, status, adminId, adminName, adminComment, createdAd);

  /// Create a copy of AdminComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminCommentImplCopyWith<_$AdminCommentImpl> get copyWith =>
      __$$AdminCommentImplCopyWithImpl<_$AdminCommentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminCommentImplToJson(
      this,
    );
  }
}

abstract class _AdminComment implements AdminComment {
  const factory _AdminComment(
      {required final int id,
      required final CommunityReportStatus status,
      required final int adminId,
      required final String adminName,
      required final String adminComment,
      required final String createdAd}) = _$AdminCommentImpl;

  factory _AdminComment.fromJson(Map<String, dynamic> json) =
      _$AdminCommentImpl.fromJson;

  @override
  int get id;
  @override
  CommunityReportStatus get status;
  @override
  int get adminId;
  @override
  String get adminName;
  @override
  String get adminComment;
  @override
  String get createdAd;

  /// Create a copy of AdminComment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminCommentImplCopyWith<_$AdminCommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
