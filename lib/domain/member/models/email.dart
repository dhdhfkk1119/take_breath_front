import 'package:freezed_annotation/freezed_annotation.dart';

part 'email.freezed.dart';
part 'email.g.dart';

@freezed
class Email with _$Email {
  const factory Email({
    required String email,
    String? code,
  }) = _Email;

  factory Email.fromJson(Map<String, dynamic> json) => _$EmailFromJson(json);
}
