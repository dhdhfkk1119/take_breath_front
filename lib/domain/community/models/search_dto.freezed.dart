// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchDto _$SearchDtoFromJson(Map<String, dynamic> json) {
  return _SearchDto.fromJson(json);
}

/// @nodoc
mixin _$SearchDto {
  String? get keyword => throw _privateConstructorUsedError;
  List<int> get categoryIds => throw _privateConstructorUsedError;
  CommunityPostSortType get sortType => throw _privateConstructorUsedError;

  /// Serializes this SearchDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchDtoCopyWith<SearchDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchDtoCopyWith<$Res> {
  factory $SearchDtoCopyWith(SearchDto value, $Res Function(SearchDto) then) =
      _$SearchDtoCopyWithImpl<$Res, SearchDto>;
  @useResult
  $Res call(
      {String? keyword, List<int> categoryIds, CommunityPostSortType sortType});
}

/// @nodoc
class _$SearchDtoCopyWithImpl<$Res, $Val extends SearchDto>
    implements $SearchDtoCopyWith<$Res> {
  _$SearchDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = freezed,
    Object? categoryIds = null,
    Object? sortType = null,
  }) {
    return _then(_value.copyWith(
      keyword: freezed == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryIds: null == categoryIds
          ? _value.categoryIds
          : categoryIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      sortType: null == sortType
          ? _value.sortType
          : sortType // ignore: cast_nullable_to_non_nullable
              as CommunityPostSortType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchDtoImplCopyWith<$Res>
    implements $SearchDtoCopyWith<$Res> {
  factory _$$SearchDtoImplCopyWith(
          _$SearchDtoImpl value, $Res Function(_$SearchDtoImpl) then) =
      __$$SearchDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? keyword, List<int> categoryIds, CommunityPostSortType sortType});
}

/// @nodoc
class __$$SearchDtoImplCopyWithImpl<$Res>
    extends _$SearchDtoCopyWithImpl<$Res, _$SearchDtoImpl>
    implements _$$SearchDtoImplCopyWith<$Res> {
  __$$SearchDtoImplCopyWithImpl(
      _$SearchDtoImpl _value, $Res Function(_$SearchDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = freezed,
    Object? categoryIds = null,
    Object? sortType = null,
  }) {
    return _then(_$SearchDtoImpl(
      keyword: freezed == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryIds: null == categoryIds
          ? _value._categoryIds
          : categoryIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      sortType: null == sortType
          ? _value.sortType
          : sortType // ignore: cast_nullable_to_non_nullable
              as CommunityPostSortType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchDtoImpl implements _SearchDto {
  const _$SearchDtoImpl(
      {this.keyword,
      final List<int> categoryIds = const [],
      this.sortType = CommunityPostSortType.LATEST})
      : _categoryIds = categoryIds;

  factory _$SearchDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchDtoImplFromJson(json);

  @override
  final String? keyword;
  final List<int> _categoryIds;
  @override
  @JsonKey()
  List<int> get categoryIds {
    if (_categoryIds is EqualUnmodifiableListView) return _categoryIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryIds);
  }

  @override
  @JsonKey()
  final CommunityPostSortType sortType;

  @override
  String toString() {
    return 'SearchDto(keyword: $keyword, categoryIds: $categoryIds, sortType: $sortType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchDtoImpl &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            const DeepCollectionEquality()
                .equals(other._categoryIds, _categoryIds) &&
            (identical(other.sortType, sortType) ||
                other.sortType == sortType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, keyword,
      const DeepCollectionEquality().hash(_categoryIds), sortType);

  /// Create a copy of SearchDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchDtoImplCopyWith<_$SearchDtoImpl> get copyWith =>
      __$$SearchDtoImplCopyWithImpl<_$SearchDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchDtoImplToJson(
      this,
    );
  }
}

abstract class _SearchDto implements SearchDto {
  const factory _SearchDto(
      {final String? keyword,
      final List<int> categoryIds,
      final CommunityPostSortType sortType}) = _$SearchDtoImpl;

  factory _SearchDto.fromJson(Map<String, dynamic> json) =
      _$SearchDtoImpl.fromJson;

  @override
  String? get keyword;
  @override
  List<int> get categoryIds;
  @override
  CommunityPostSortType get sortType;

  /// Create a copy of SearchDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchDtoImplCopyWith<_$SearchDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
