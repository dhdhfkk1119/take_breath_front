import 'package:freezed_annotation/freezed_annotation.dart';

part 'is_email_check.freezed.dart';
part 'is_email_check.g.dart';

@freezed
class IsEmailCheck with _$IsEmailCheck {
  const factory IsEmailCheck({
    required String message,
    required bool check,
  }) = _IsEmailCheck;

  factory IsEmailCheck.fromJson(Map<String, dynamic> json) =>
      _$IsEmailCheckFromJson(json);
}
