import 'package:freezed_annotation/freezed_annotation.dart';

part 'member.freezed.dart';
part 'member.g.dart';

@freezed
class Member with _$Member {
  const factory Member({
    required String accessToken,
    String? refreshToken,
    required int id,
    required String nickName,
    required String email,
    String? profileImageUrl, // nullable 처리
    required String role,
    required String status,
    int? daysLeft,
  }) = _Member;

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
}
