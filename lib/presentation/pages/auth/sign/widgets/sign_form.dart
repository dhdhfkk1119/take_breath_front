import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:take_breath/_core/constants/custom_text_button.dart';
import 'package:take_breath/_core/constants/custom_text_form_field.dart';
import 'package:take_breath/presentation/pages/auth/terms/terms_page.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  // 각각의 controller를 개별로 생성

  final phoneMaskFormatter = MaskTextInputFormatter(
    mask: '###-####-####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordCheckController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  bool isCodeEnabled = false; // 인증 코드 입력 활성화 여부

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          // 이메일 + 인증 버튼
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "이메일",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  // 이메일 입력창
                  Expanded(
                    child: CustomTextFormField(
                      hint: "이메일을 입력하세요",
                      controller: emailController,
                    ),
                  ),
                  const SizedBox(width: 8),
                  // 인증 버튼
                  ElevatedButton(
                    onPressed: () {
                      // 이메일 인증 로직 추가 가능
                      setState(() {
                        isCodeEnabled = true; // 인증 코드 입력 활성화
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 14),
                    ),
                    child: const Text("이메일 인증"),
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),

          // 인증코드 입력
          buildTextFormField("인증코드", codeController, enabled: isCodeEnabled),

          buildTextFormField("유저 닉네임", nicknameController),
          buildTextFormField("비밀번호", passwordController, obscureText: true),
          buildTextFormField("비밀번호 확인", passwordCheckController,
              obscureText: true),
          buildTextFormField("사용자 이름", nameController),
          buildTextFormField(
            "핸드폰 번호",
            phoneController,
            inputFormatters: [phoneMaskFormatter],
            keyboardType: TextInputType.phone,
          ),
          buildTextFormField("주소", addressController),

          const SizedBox(height: 8),
          CustomTextButton(
            text: "회원가입",
            click: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TermsPage()));
            },
          ),
        ],
      ),
    );
  }

  Widget buildTextFormField(
    String hint,
    TextEditingController controller, {
    bool obscureText = false,
    bool enabled = true,
    List<TextInputFormatter>? inputFormatters,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hint,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        CustomTextFormField(
          hint: hint,
          controller: controller,
          obscureText: obscureText,
          enabled: enabled,
          inputFormatters: inputFormatters,
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
