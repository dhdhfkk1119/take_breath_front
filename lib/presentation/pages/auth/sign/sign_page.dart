import 'package:flutter/material.dart';
import 'package:take_breath/_core/utils/widgets_app_bar.dart';
import 'package:take_breath/presentation/pages/auth/sign/widgets/sign_form.dart';

class SignPage extends StatelessWidget {
  const SignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetsAppBar(title: "회원가입"),
      body: SignForm(),
    );
  }
}
