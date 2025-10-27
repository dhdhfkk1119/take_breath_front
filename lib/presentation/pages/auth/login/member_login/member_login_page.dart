import 'package:flutter/material.dart';
import 'package:take_breath/_core/utils/widgets_app_bar.dart';
import 'package:take_breath/presentation/pages/auth/login/member_login/widgets/member_login_form.dart';

class MemberLoginPage extends StatelessWidget {
  const MemberLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetsAppBar(
        title: "유저 로그인 페이지",
      ),
      body: MemberLoginForm(),
    );
  }
}
