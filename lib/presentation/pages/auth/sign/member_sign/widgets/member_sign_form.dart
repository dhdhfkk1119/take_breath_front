import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:take_breath/_core/constants/custom_color.dart';
import 'package:take_breath/_core/constants/custom_text_button.dart';
import 'package:take_breath/_core/constants/custom_text_form_field.dart';
import 'package:take_breath/_core/utils/snackbar_util.dart';
import 'package:take_breath/domain/member/models/email.dart';
import 'package:take_breath/domain/member/providers/member_login_notifier.dart';
import 'package:take_breath/domain/member/providers/member_repository_provider.dart';
import 'package:take_breath/domain/member/providers/member_sign_notifier.dart';
import 'package:take_breath/presentation/pages/auth/terms/terms_page.dart';

class MemberSignForm extends ConsumerStatefulWidget {
  const MemberSignForm({super.key});

  @override
  ConsumerState<MemberSignForm> createState() => _MemberSignFormState();
}

class _MemberSignFormState extends ConsumerState<MemberSignForm> {
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

  bool isCodeEnabled = false;
  bool isEmailEnabled = false;

  @override
  Widget build(BuildContext context) {
    final memberNotifier = ref.read(memberRepositoryProvider);

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
                    onPressed: () async {
                      final result = await memberNotifier
                          .isEmailCheck(emailController.text);
                      if (result.check) {
                        SnackBarUtil.showWarning(context, result.message);
                        setState(() {
                          isEmailEnabled = false;
                        });
                      } else {
                        SnackBarUtil.showSuccess(context, result.message);

                        setState(() {
                          isEmailEnabled = true;
                        });

                        await memberNotifier.sendCode(
                          Email(email: emailController.text, code: ""),
                        );

                        SnackBarUtil.showSuccess(
                            context, "인증 코드가 이메일로 전송되었습니다.");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 14),
                    ),
                    child: const Text("중복 확인"),
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CustomTextFormField(
                    hint: "인증코드",
                    controller: codeController,
                    enabled: isEmailEnabled),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () async {
                  final result = await memberNotifier.verifyCode(
                    Email(
                      email: emailController.text,
                      code: codeController.text,
                    ),
                  );
                  if (result) {
                    SnackBarUtil.showSuccess(context, "인증 성공");
                    setState(() {
                      isCodeEnabled = true;
                    });
                  } else {
                    SnackBarUtil.showError(context, "인증 실패");
                    setState(() {
                      isCodeEnabled = false;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                ),
                child: const Text("코드 확인"),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
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
            click: (isCodeEnabled && isEmailEnabled)
                ? () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TermsPage()));
                  }
                : null,
            color: (isCodeEnabled && isEmailEnabled)
                ? brandBackColor
                : Colors.grey,
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
