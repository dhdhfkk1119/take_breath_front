// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recorder_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecorderState {
  List<RecordItem> get records => throw _privateConstructorUsedError;
  String get filterType => throw _privateConstructorUsedError;
  DateTime? get selectedDate => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of RecorderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecorderStateCopyWith<RecorderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecorderStateCopyWith<$Res> {
  factory $RecorderStateCopyWith(
          RecorderState value, $Res Function(RecorderState) then) =
      _$RecorderStateCopyWithImpl<$Res, RecorderState>;
  @useResult
  $Res call(
      {List<RecordItem> records,
      String filterType,
      DateTime? selectedDate,
      bool isLoading,
      String? error});
}

/// @nodoc
class _$RecorderStateCopyWithImpl<$Res, $Val extends RecorderState>
    implements $RecorderStateCopyWith<$Res> {
  _$RecorderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecorderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? records = null,
    Object? filterType = null,
    Object? selectedDate = freezed,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      records: null == records
          ? _value.records
          : records // ignore: cast_nullable_to_non_nullable
              as List<RecordItem>,
      filterType: null == filterType
          ? _value.filterType
          : filterType // ignore: cast_nullable_to_non_nullable
              as String,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecorderStateImplCopyWith<$Res>
    implements $RecorderStateCopyWith<$Res> {
  factory _$$RecorderStateImplCopyWith(
          _$RecorderStateImpl value, $Res Function(_$RecorderStateImpl) then) =
      __$$RecorderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<RecordItem> records,
      String filterType,
      DateTime? selectedDate,
      bool isLoading,
      String? error});
}

/// @nodoc
class __$$RecorderStateImplCopyWithImpl<$Res>
    extends _$RecorderStateCopyWithImpl<$Res, _$RecorderStateImpl>
    implements _$$RecorderStateImplCopyWith<$Res> {
  __$$RecorderStateImplCopyWithImpl(
      _$RecorderStateImpl _value, $Res Function(_$RecorderStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecorderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? records = null,
    Object? filterType = null,
    Object? selectedDate = freezed,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$RecorderStateImpl(
      records: null == records
          ? _value._records
          : records // ignore: cast_nullable_to_non_nullable
              as List<RecordItem>,
      filterType: null == filterType
          ? _value.filterType
          : filterType // ignore: cast_nullable_to_non_nullable
              as String,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RecorderStateImpl implements _RecorderState {
  const _$RecorderStateImpl(
      {required final List<RecordItem> records,
      required this.filterType,
      required this.selectedDate,
      required this.isLoading,
      required this.error})
      : _records = records;

  final List<RecordItem> _records;
  @override
  List<RecordItem> get records {
    if (_records is EqualUnmodifiableListView) return _records;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_records);
  }

  @override
  final String filterType;
  @override
  final DateTime? selectedDate;
  @override
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'RecorderState(records: $records, filterType: $filterType, selectedDate: $selectedDate, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecorderStateImpl &&
            const DeepCollectionEquality().equals(other._records, _records) &&
            (identical(other.filterType, filterType) ||
                other.filterType == filterType) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_records),
      filterType,
      selectedDate,
      isLoading,
      error);

  /// Create a copy of RecorderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecorderStateImplCopyWith<_$RecorderStateImpl> get copyWith =>
      __$$RecorderStateImplCopyWithImpl<_$RecorderStateImpl>(this, _$identity);
}

abstract class _RecorderState implements RecorderState {
  const factory _RecorderState(
      {required final List<RecordItem> records,
      required final String filterType,
      required final DateTime? selectedDate,
      required final bool isLoading,
      required final String? error}) = _$RecorderStateImpl;

  @override
  List<RecordItem> get records;
  @override
  String get filterType;
  @override
  DateTime? get selectedDate;
  @override
  bool get isLoading;
  @override
  String? get error;

  /// Create a copy of RecorderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecorderStateImplCopyWith<_$RecorderStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
