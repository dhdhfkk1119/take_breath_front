import 'package:flutter/material.dart';
import 'package:take_breath/_core/utils/widgets_app_bar.dart';
import 'package:take_breath/presentation/pages/auth/login/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetsAppBar(
        title: "로그인 페이지",
      ),
      body: LoginForm(),
    );
  }
}
