import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:take_breath/_core/constants/custom_color.dart';
import 'package:take_breath/_core/constants/custom_text_button.dart';
import 'package:take_breath/_core/constants/custom_text_form_field.dart';
import 'package:take_breath/_core/utils/snackbar_util.dart';
import 'package:take_breath/domain/member/models/email.dart';
// import 'package:take_breath/domain/member/providers/member_login_notifier.dart'; // 사용되지 않음
import 'package:take_breath/domain/member/providers/member_repository_provider.dart';
import 'package:take_breath/domain/member/providers/member_sign_notifier.dart';
import 'package:take_breath/presentation/pages/auth/terms/terms_page.dart';
import 'package:take_breath/domain/member/models/terms_request.dart'; // ⭐️ TermsRequest 모델 Import

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
  void dispose() {
    emailController.dispose();
    codeController.dispose();
    nicknameController.dispose();
    passwordController.dispose();
    passwordCheckController.dispose();
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // MemberRepository 대신 Notifier를 통해 이메일 인증/중복 검사를 수행합니다.
    // 이는 Notifier에 해당 로직을 포함시키기로 했기 때문입니다.
    final memberSignNotifier = ref.read(memberSignProvider.notifier);

    // Notifier 상태를 watch하여 비밀번호 검증 등의 추가 로직을 구현할 수 있습니다.
    // final memberSignState = ref.watch(memberSignProvider);

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
                      onChanged: (value) =>
                          memberSignNotifier.updateForm(email: value),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // 인증 버튼
                  ElevatedButton(
                    onPressed: () async {
                      final result = await memberSignNotifier
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

                        await memberSignNotifier.sendCode(emailController.text);

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
                  final result = await memberSignNotifier.verifyCode(
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
          buildTextFormField("유저 닉네임", nicknameController,
              onChanged: (value) => memberSignNotifier.updateForm(name: value)),
          buildTextFormField("비밀번호", passwordController,
              obscureText: true,
              onChanged: (value) =>
                  memberSignNotifier.updateForm(password: value)),
          buildTextFormField("비밀번호 확인", passwordCheckController,
              obscureText: true,
              onChanged: (value) =>
                  memberSignNotifier.updateForm(confirmPassword: value)),
          buildTextFormField("사용자 이름", nameController,
              onChanged: (value) => memberSignNotifier.updateForm(name: value)),
          buildTextFormField(
            "핸드폰 번호",
            phoneController,
            inputFormatters: [phoneMaskFormatter],
            keyboardType: TextInputType.phone,
            onChanged: (value) =>
                memberSignNotifier.updateForm(phone: value.replaceAll('-', '')),
          ),
          buildTextFormField("주소", addressController,
              onChanged: (value) =>
                  memberSignNotifier.updateForm(address: value)),

          const SizedBox(height: 8),
          CustomTextButton(
            text: "회원가입",
            click: (isCodeEnabled && isEmailEnabled)
                ? () async {
                    if (passwordController.text !=
                        passwordCheckController.text) {
                      SnackBarUtil.showError(context, "비밀번호가 일치하지 않습니다.");
                      return;
                    }

                    final agreements = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TermsPage()));

                    if (agreements != null &&
                        agreements is List<TermsRequest>) {
                      memberSignNotifier.setAgreements(agreements);

                      try {
                        await memberSignNotifier.sign();

                        SnackBarUtil.showSuccess(
                            context, "회원가입이 완료되었습니다! 로그인해 주세요.");
                        Navigator.pop(context);
                      } catch (e) {
                        SnackBarUtil.showError(
                            context, "회원가입 실패: ${e.toString()}");
                      }
                    } else {
                      SnackBarUtil.showWarning(context, "약관 동의가 필요합니다.");
                    }
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
    ValueChanged<String>? onChanged,
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
          keyboardType: keyboardType,
          onChanged: onChanged,
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
