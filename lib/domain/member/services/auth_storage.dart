import 'package:shared_preferences/shared_preferences.dart';
import 'package:take_breath/domain/member/models/member.dart';

class AuthStorage {
  static Future<void> saveTokens(
      String accessToken, String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', accessToken);
    await prefs.setString('refreshToken', refreshToken);
  }

  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken');
  }

  static Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('refreshToken');
  }

  static Future<void> saveUserInfo(Member member) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('id', member.id.toString());
    await prefs.setString('nickName', member.nickName);
    await prefs.setString('email', member.email);
    await prefs.setString('profileImageUrl', member.profileImageUrl ?? "");
    await prefs.setString('role', member.role);
    await prefs.setString('status', member.status);
    await prefs.setString('phone', member.phone);
    await prefs.setString('accessToken', member.accessToken);
    await prefs.setString('refreshToken', member.refreshToken ?? "");
  }

  static Future<Member?> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getString('id');
    if (id == null) return null;

    return Member(
      id: int.parse(id),
      nickName: prefs.getString('nickName') ?? '',
      email: prefs.getString('email') ?? '',
      profileImageUrl: prefs.getString('profileImageUrl') ?? '',
      role: prefs.getString('role') ?? '',
      status: prefs.getString('status') ?? '',
      phone: prefs.getString('phone') ?? '',
      accessToken: prefs.getString('accessToken') ?? '',
      refreshToken: prefs.getString('refreshToken') ?? '',
    );
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('accessToken');
    await prefs.remove('refreshToken');
    await prefs.remove('id');
    await prefs.remove('nickName');
    await prefs.remove('email');
    await prefs.remove('profileImageUrl');
    await prefs.remove('role');
    await prefs.remove('status');
    await prefs.remove('phone');
  }
}
