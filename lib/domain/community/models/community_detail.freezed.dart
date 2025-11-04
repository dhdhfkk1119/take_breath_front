// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommunityDetail _$CommunityDetailFromJson(Map<String, dynamic> json) {
  return _CommunityDetail.fromJson(json);
}

/// @nodoc
mixin _$CommunityDetail {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  int? get memberId => throw _privateConstructorUsedError; // nullable
  String? get memberName => throw _privateConstructorUsedError; // nullable
  String? get categoryName => throw _privateConstructorUsedError; // nullable
  int? get categoryId => throw _privateConstructorUsedError; // nullable
  int get likeCount => throw _privateConstructorUsedError;
  int get viewCount => throw _privateConstructorUsedError;
  int get commentCount => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'modified')
  bool get isModified => throw _privateConstructorUsedError;
  bool get liked => throw _privateConstructorUsedError;
  List<String> get imageUrls => throw _privateConstructorUsedError;
  List<CommunityCommentResponse> get comments =>
      throw _privateConstructorUsedError;

  /// Serializes this CommunityDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommunityDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommunityDetailCopyWith<CommunityDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunityDetailCopyWith<$Res> {
  factory $CommunityDetailCopyWith(
          CommunityDetail value, $Res Function(CommunityDetail) then) =
      _$CommunityDetailCopyWithImpl<$Res, CommunityDetail>;
  @useResult
  $Res call(
      {int id,
      String title,
      String content,
      int? memberId,
      String? memberName,
      String? categoryName,
      int? categoryId,
      int likeCount,
      int viewCount,
      int commentCount,
      String createdAt,
      String updatedAt,
      @JsonKey(name: 'modified') bool isModified,
      bool liked,
      List<String> imageUrls,
      List<CommunityCommentResponse> comments});
}

/// @nodoc
class _$CommunityDetailCopyWithImpl<$Res, $Val extends CommunityDetail>
    implements $CommunityDetailCopyWith<$Res> {
  _$CommunityDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommunityDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? memberId = freezed,
    Object? memberName = freezed,
    Object? categoryName = freezed,
    Object? categoryId = freezed,
    Object? likeCount = null,
    Object? viewCount = null,
    Object? commentCount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isModified = null,
    Object? liked = null,
    Object? imageUrls = null,
    Object? comments = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      memberId: freezed == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as int?,
      memberName: freezed == memberName
          ? _value.memberName
          : memberName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      isModified: null == isModified
          ? _value.isModified
          : isModified // ignore: cast_nullable_to_non_nullable
              as bool,
      liked: null == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool,
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommunityCommentResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommunityDetailImplCopyWith<$Res>
    implements $CommunityDetailCopyWith<$Res> {
  factory _$$CommunityDetailImplCopyWith(_$CommunityDetailImpl value,
          $Res Function(_$CommunityDetailImpl) then) =
      __$$CommunityDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String content,
      int? memberId,
      String? memberName,
      String? categoryName,
      int? categoryId,
      int likeCount,
      int viewCount,
      int commentCount,
      String createdAt,
      String updatedAt,
      @JsonKey(name: 'modified') bool isModified,
      bool liked,
      List<String> imageUrls,
      List<CommunityCommentResponse> comments});
}

/// @nodoc
class __$$CommunityDetailImplCopyWithImpl<$Res>
    extends _$CommunityDetailCopyWithImpl<$Res, _$CommunityDetailImpl>
    implements _$$CommunityDetailImplCopyWith<$Res> {
  __$$CommunityDetailImplCopyWithImpl(
      _$CommunityDetailImpl _value, $Res Function(_$CommunityDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommunityDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? memberId = freezed,
    Object? memberName = freezed,
    Object? categoryName = freezed,
    Object? categoryId = freezed,
    Object? likeCount = null,
    Object? viewCount = null,
    Object? commentCount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isModified = null,
    Object? liked = null,
    Object? imageUrls = null,
    Object? comments = null,
  }) {
    return _then(_$CommunityDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      memberId: freezed == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as int?,
      memberName: freezed == memberName
          ? _value.memberName
          : memberName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      isModified: null == isModified
          ? _value.isModified
          : isModified // ignore: cast_nullable_to_non_nullable
              as bool,
      liked: null == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool,
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommunityCommentResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommunityDetailImpl implements _CommunityDetail {
  const _$CommunityDetailImpl(
      {required this.id,
      required this.title,
      required this.content,
      this.memberId,
      this.memberName,
      this.categoryName,
      this.categoryId,
      this.likeCount = 0,
      this.viewCount = 0,
      this.commentCount = 0,
      required this.createdAt,
      required this.updatedAt,
      @JsonKey(name: 'modified') required this.isModified,
      this.liked = false,
      final List<String> imageUrls = const [],
      final List<CommunityCommentResponse> comments = const []})
      : _imageUrls = imageUrls,
        _comments = comments;

  factory _$CommunityDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommunityDetailImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String content;
  @override
  final int? memberId;
// nullable
  @override
  final String? memberName;
// nullable
  @override
  final String? categoryName;
// nullable
  @override
  final int? categoryId;
// nullable
  @override
  @JsonKey()
  final int likeCount;
  @override
  @JsonKey()
  final int viewCount;
  @override
  @JsonKey()
  final int commentCount;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  @JsonKey(name: 'modified')
  final bool isModified;
  @override
  @JsonKey()
  final bool liked;
  final List<String> _imageUrls;
  @override
  @JsonKey()
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  final List<CommunityCommentResponse> _comments;
  @override
  @JsonKey()
  List<CommunityCommentResponse> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  String toString() {
    return 'CommunityDetail(id: $id, title: $title, content: $content, memberId: $memberId, memberName: $memberName, categoryName: $categoryName, categoryId: $categoryId, likeCount: $likeCount, viewCount: $viewCount, commentCount: $commentCount, createdAt: $createdAt, updatedAt: $updatedAt, isModified: $isModified, liked: $liked, imageUrls: $imageUrls, comments: $comments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunityDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.memberId, memberId) ||
                other.memberId == memberId) &&
            (identical(other.memberName, memberName) ||
                other.memberName == memberName) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.commentCount, commentCount) ||
                other.commentCount == commentCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isModified, isModified) ||
                other.isModified == isModified) &&
            (identical(other.liked, liked) || other.liked == liked) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            const DeepCollectionEquality().equals(other._comments, _comments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      content,
      memberId,
      memberName,
      categoryName,
      categoryId,
      likeCount,
      viewCount,
      commentCount,
      createdAt,
      updatedAt,
      isModified,
      liked,
      const DeepCollectionEquality().hash(_imageUrls),
      const DeepCollectionEquality().hash(_comments));

  /// Create a copy of CommunityDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunityDetailImplCopyWith<_$CommunityDetailImpl> get copyWith =>
      __$$CommunityDetailImplCopyWithImpl<_$CommunityDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommunityDetailImplToJson(
      this,
    );
  }
}

abstract class _CommunityDetail implements CommunityDetail {
  const factory _CommunityDetail(
      {required final int id,
      required final String title,
      required final String content,
      final int? memberId,
      final String? memberName,
      final String? categoryName,
      final int? categoryId,
      final int likeCount,
      final int viewCount,
      final int commentCount,
      required final String createdAt,
      required final String updatedAt,
      @JsonKey(name: 'modified') required final bool isModified,
      final bool liked,
      final List<String> imageUrls,
      final List<CommunityCommentResponse> comments}) = _$CommunityDetailImpl;

  factory _CommunityDetail.fromJson(Map<String, dynamic> json) =
      _$CommunityDetailImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get content;
  @override
  int? get memberId; // nullable
  @override
  String? get memberName; // nullable
  @override
  String? get categoryName; // nullable
  @override
  int? get categoryId; // nullable
  @override
  int get likeCount;
  @override
  int get viewCount;
  @override
  int get commentCount;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  @JsonKey(name: 'modified')
  bool get isModified;
  @override
  bool get liked;
  @override
  List<String> get imageUrls;
  @override
  List<CommunityCommentResponse> get comments;

  /// Create a copy of CommunityDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommunityDetailImplCopyWith<_$CommunityDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
