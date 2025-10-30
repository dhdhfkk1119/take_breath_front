import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/constants/custom_text_button.dart';
import 'package:take_breath/_core/constants/custom_text_form_field.dart';
import 'package:take_breath/_core/utils/snackbar_util.dart';
import 'package:take_breath/domain/member/providers/member_login_notifier.dart';

class MemberLoginForm extends ConsumerStatefulWidget {
  const MemberLoginForm({super.key});

  @override
  ConsumerState<MemberLoginForm> createState() => _MemberLoginFormState();
}

class _MemberLoginFormState extends ConsumerState<MemberLoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isAutoLoginChecked = false;

  @override
  Widget build(BuildContext context) {
    final loginNotifier = ref.read(memberProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("이메일",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          CustomTextFormField(
            hint: "user@test.com",
            controller: _emailController,
          ),
          SizedBox(height: 20),
          Text("비밀번호",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          CustomTextFormField(
            hint: "1234",
            controller: _passwordController,
            obscureText: true,
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Checkbox(
                value: _isAutoLoginChecked, // 현재 상태 변수 연결
                onChanged: (bool? newValue) {
                  setState(() {
                    _isAutoLoginChecked = newValue ?? false;
                  });
                },
              ),
              Text(
                "자동 로그인",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          CustomTextButton(
            text: "로그인",
            click: () async {
              try {
                await loginNotifier.loginUser(
                  "user@test.com",
                  "1234",
                  _isAutoLoginChecked,
                );
                if (mounted) {
                  Navigator.pushReplacementNamed(context, '/main');
                }
                SnackBarUtil.showSuccessGlobally("로그인 성공");
              } catch (e) {
                SnackBarUtil.showErrorGlobally(
                    "로그인에 실패했습니다 아이디 또는 비밀번호를 다시 생각해");
              }
            },
          ),
        ],
      ),
    );
  }
}
