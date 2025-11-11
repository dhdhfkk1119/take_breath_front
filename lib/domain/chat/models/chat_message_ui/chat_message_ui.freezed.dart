// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message_ui.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatMessageUI {
  ChatMessageResponse get message => throw _privateConstructorUsedError;
  bool get isMe => throw _privateConstructorUsedError;
  bool get showProfile => throw _privateConstructorUsedError;
  bool get showTimestamp => throw _privateConstructorUsedError;

  /// Create a copy of ChatMessageUI
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatMessageUICopyWith<ChatMessageUI> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageUICopyWith<$Res> {
  factory $ChatMessageUICopyWith(
          ChatMessageUI value, $Res Function(ChatMessageUI) then) =
      _$ChatMessageUICopyWithImpl<$Res, ChatMessageUI>;
  @useResult
  $Res call(
      {ChatMessageResponse message,
      bool isMe,
      bool showProfile,
      bool showTimestamp});

  $ChatMessageResponseCopyWith<$Res> get message;
}

/// @nodoc
class _$ChatMessageUICopyWithImpl<$Res, $Val extends ChatMessageUI>
    implements $ChatMessageUICopyWith<$Res> {
  _$ChatMessageUICopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatMessageUI
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? isMe = null,
    Object? showProfile = null,
    Object? showTimestamp = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as ChatMessageResponse,
      isMe: null == isMe
          ? _value.isMe
          : isMe // ignore: cast_nullable_to_non_nullable
              as bool,
      showProfile: null == showProfile
          ? _value.showProfile
          : showProfile // ignore: cast_nullable_to_non_nullable
              as bool,
      showTimestamp: null == showTimestamp
          ? _value.showTimestamp
          : showTimestamp // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of ChatMessageUI
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatMessageResponseCopyWith<$Res> get message {
    return $ChatMessageResponseCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatMessageUIImplCopyWith<$Res>
    implements $ChatMessageUICopyWith<$Res> {
  factory _$$ChatMessageUIImplCopyWith(
          _$ChatMessageUIImpl value, $Res Function(_$ChatMessageUIImpl) then) =
      __$$ChatMessageUIImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ChatMessageResponse message,
      bool isMe,
      bool showProfile,
      bool showTimestamp});

  @override
  $ChatMessageResponseCopyWith<$Res> get message;
}

/// @nodoc
class __$$ChatMessageUIImplCopyWithImpl<$Res>
    extends _$ChatMessageUICopyWithImpl<$Res, _$ChatMessageUIImpl>
    implements _$$ChatMessageUIImplCopyWith<$Res> {
  __$$ChatMessageUIImplCopyWithImpl(
      _$ChatMessageUIImpl _value, $Res Function(_$ChatMessageUIImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatMessageUI
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? isMe = null,
    Object? showProfile = null,
    Object? showTimestamp = null,
  }) {
    return _then(_$ChatMessageUIImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as ChatMessageResponse,
      isMe: null == isMe
          ? _value.isMe
          : isMe // ignore: cast_nullable_to_non_nullable
              as bool,
      showProfile: null == showProfile
          ? _value.showProfile
          : showProfile // ignore: cast_nullable_to_non_nullable
              as bool,
      showTimestamp: null == showTimestamp
          ? _value.showTimestamp
          : showTimestamp // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChatMessageUIImpl extends _ChatMessageUI {
  const _$ChatMessageUIImpl(
      {required this.message,
      required this.isMe,
      this.showProfile = true,
      this.showTimestamp = true})
      : super._();

  @override
  final ChatMessageResponse message;
  @override
  final bool isMe;
  @override
  @JsonKey()
  final bool showProfile;
  @override
  @JsonKey()
  final bool showTimestamp;

  @override
  String toString() {
    return 'ChatMessageUI(message: $message, isMe: $isMe, showProfile: $showProfile, showTimestamp: $showTimestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessageUIImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isMe, isMe) || other.isMe == isMe) &&
            (identical(other.showProfile, showProfile) ||
                other.showProfile == showProfile) &&
            (identical(other.showTimestamp, showTimestamp) ||
                other.showTimestamp == showTimestamp));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, message, isMe, showProfile, showTimestamp);

  /// Create a copy of ChatMessageUI
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessageUIImplCopyWith<_$ChatMessageUIImpl> get copyWith =>
      __$$ChatMessageUIImplCopyWithImpl<_$ChatMessageUIImpl>(this, _$identity);
}

abstract class _ChatMessageUI extends ChatMessageUI {
  const factory _ChatMessageUI(
      {required final ChatMessageResponse message,
      required final bool isMe,
      final bool showProfile,
      final bool showTimestamp}) = _$ChatMessageUIImpl;
  const _ChatMessageUI._() : super._();

  @override
  ChatMessageResponse get message;
  @override
  bool get isMe;
  @override
  bool get showProfile;
  @override
  bool get showTimestamp;

  /// Create a copy of ChatMessageUI
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatMessageUIImplCopyWith<_$ChatMessageUIImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
