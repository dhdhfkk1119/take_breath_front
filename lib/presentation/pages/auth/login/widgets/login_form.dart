import 'package:flutter/material.dart';
import 'package:take_breath/_core/constants/custom_text_button.dart';
import 'package:take_breath/_core/constants/custom_text_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("이메일",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          CustomTextFormField(
            hint: "이메일",
            controller: _emailController,
          ),
          SizedBox(height: 20),
          Text("비밀번호",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          CustomTextFormField(
            hint: "비밀번호",
            controller: _passwordController,
          ),
          SizedBox(height: 20),
          CustomTextButton(
            text: "로그인",
            click: () {},
          ),
        ],
      ),
    );
  }
}
