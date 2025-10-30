// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'term.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Term _$TermFromJson(Map<String, dynamic> json) {
  return _Term.fromJson(json);
}

/// @nodoc
mixin _$Term {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  /// Serializes this Term to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Term
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TermCopyWith<Term> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TermCopyWith<$Res> {
  factory $TermCopyWith(Term value, $Res Function(Term) then) =
      _$TermCopyWithImpl<$Res, Term>;
  @useResult
  $Res call({int id, String title, String content});
}

/// @nodoc
class _$TermCopyWithImpl<$Res, $Val extends Term>
    implements $TermCopyWith<$Res> {
  _$TermCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Term
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TermImplCopyWith<$Res> implements $TermCopyWith<$Res> {
  factory _$$TermImplCopyWith(
          _$TermImpl value, $Res Function(_$TermImpl) then) =
      __$$TermImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, String content});
}

/// @nodoc
class __$$TermImplCopyWithImpl<$Res>
    extends _$TermCopyWithImpl<$Res, _$TermImpl>
    implements _$$TermImplCopyWith<$Res> {
  __$$TermImplCopyWithImpl(_$TermImpl _value, $Res Function(_$TermImpl) _then)
      : super(_value, _then);

  /// Create a copy of Term
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
  }) {
    return _then(_$TermImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TermImpl implements _Term {
  const _$TermImpl(
      {required this.id, required this.title, required this.content});

  factory _$TermImpl.fromJson(Map<String, dynamic> json) =>
      _$$TermImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String content;

  @override
  String toString() {
    return 'Term(id: $id, title: $title, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TermImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, content);

  /// Create a copy of Term
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TermImplCopyWith<_$TermImpl> get copyWith =>
      __$$TermImplCopyWithImpl<_$TermImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TermImplToJson(
      this,
    );
  }
}

abstract class _Term implements Term {
  const factory _Term(
      {required final int id,
      required final String title,
      required final String content}) = _$TermImpl;

  factory _Term.fromJson(Map<String, dynamic> json) = _$TermImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get content;

  /// Create a copy of Term
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TermImplCopyWith<_$TermImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
