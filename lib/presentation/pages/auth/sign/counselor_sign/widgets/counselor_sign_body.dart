import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:take_breath/_core/constants/custom_color.dart';
import 'package:take_breath/_core/constants/custom_text_button.dart';
import 'package:take_breath/_core/constants/custom_text_form_field.dart';
import 'package:take_breath/_core/utils/email_valid_action_util.dart';
import 'package:take_breath/_core/utils/snackbar_util.dart';
import 'package:take_breath/domain/counselor/models/counselor_license_request.dart';
import 'package:take_breath/domain/counselor/providers/counselor_repository_provider.dart';
import 'package:take_breath/domain/counselor/providers/counselor_sign_notifier.dart';
import 'package:take_breath/domain/member/models/email.dart';
import 'package:take_breath/domain/member/models/terms_request.dart';
import 'package:take_breath/domain/member/providers/member_sign_notifier.dart';
import 'package:take_breath/presentation/pages/auth/terms/terms_page.dart';

import 'counselor_info_form_body.dart';

class CounselorSignBody extends ConsumerStatefulWidget {
  const CounselorSignBody({super.key});

  @override
  ConsumerState<CounselorSignBody> createState() => _CounselorSignBodyState();
}

class _CounselorSignBodyState extends ConsumerState<CounselorSignBody> {
  int _nextLicenseId = 1;

  // 컨트롤러들
  final phoneMaskFormatter = MaskTextInputFormatter(
    mask: '###-####-####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordCheckController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController specialtyController = TextEditingController();
  final TextEditingController introductionController = TextEditingController();
  final TextEditingController hashtagsController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  bool isCodeEnabled = false;
  bool isEmailEnabled = false;

  String? selectedGender; // 성별 선택 (남 or 여)
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
        ref.read(counselorSignProvider.notifier).updateForm(
              profileImage: pickedFile.path,
            );
      });
    }
  }

  void _addLicenseForm() {
    final newId = _nextLicenseId++; // 고유 아이디 값 증가 로컬에서
    final counselorSignNotifier = ref.read(counselorSignProvider.notifier);
    final newLicense = CounselorLicenseRequest(
      id: newId,
      licenseName: '',
      licenseNumber: '',
      licenseRegiNumber: '',
      licenseImage: '',
    );

    counselorSignNotifier.addLicense(newLicense);
  }

  void _removeLicenseForm(int licenseId) {
    ref.read(counselorSignProvider.notifier).removeLicense(licenseId);
  }

  @override
  void dispose() {
    emailController.dispose();
    codeController.dispose();
    passwordController.dispose();
    passwordCheckController.dispose();
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    specialtyController.dispose();
    introductionController.dispose();
    hashtagsController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final memberSignNotifier = ref.read(memberSignProvider.notifier);
    final counselorSignNotifier = ref.read(counselorSignProvider.notifier);

    // 상태 관리 수시로
    final licenses =
        ref.watch(counselorSignProvider.select((state) => state.licenses));

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Center(
            child: GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey.shade200,
                backgroundImage:
                    _profileImage != null ? FileImage(_profileImage!) : null,
                child: _profileImage == null
                    ? const Icon(
                        Icons.camera_alt,
                        size: 40,
                        color: Colors.grey,
                      )
                    : null,
              ),
            ),
          ),
          const SizedBox(height: 20),
          _buildEmailField(counselorSignNotifier, memberSignNotifier),
          _buildCodeField(memberSignNotifier),
          buildTextFormField(
            "이름",
            nameController,
            onChanged: (value) => counselorSignNotifier.updateForm(name: value),
          ),
          buildTextFormField(
            "비밀번호",
            passwordController,
            obscureText: true,
            onChanged: (value) =>
                counselorSignNotifier.updateForm(password: value),
          ),
          buildTextFormField(
            "비밀번호 확인",
            passwordCheckController,
            obscureText: true,
            onChanged: (value) =>
                counselorSignNotifier.updateForm(confirmPassword: value),
          ),
          buildTextFormField(
            "핸드폰 번호",
            phoneController,
            inputFormatters: [phoneMaskFormatter],
            keyboardType: TextInputType.phone,
            onChanged: (value) =>
                counselorSignNotifier.updateForm(phone: value),
          ),
          buildTextFormField(
            "주소",
            addressController,
            onChanged: (value) =>
                counselorSignNotifier.updateForm(address: value),
          ),
          const SizedBox(height: 12),
          const Text(
            "성별",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          _buildGenderField(counselorSignNotifier),
          buildTextFormField(
            "분야",
            specialtyController,
            onChanged: (value) =>
                counselorSignNotifier.updateForm(specialty: value),
          ),
          buildTextFormField(
            "한줄 소개",
            introductionController,
            onChanged: (value) =>
                counselorSignNotifier.updateForm(introduction: value),
          ),
          buildTextFormField(
            "해시태그",
            hashtagsController,
            onChanged: (value) =>
                counselorSignNotifier.updateForm(hashtags: value),
          ),
          buildTextFormField(
            "기격",
            priceController,
            onChanged: (value) =>
                counselorSignNotifier.updateForm(price: value as int),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "자격증 등록",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: _addLicenseForm,
              )
            ],
          ),
          Column(
            children: licenses.map((license) {
              return CounselorInfoFormBody(
                key: ValueKey(license.id),
                license: license,
                onRemove: () => _removeLicenseForm(license.id),
              );
            }).toList(),
          ),
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
                      counselorSignNotifier.setAgreements(agreements);

                      try {
                        await counselorSignNotifier.sign();

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

  // 이메일 필드 + 인증 버튼
  Widget _buildEmailField(CounselorSignNotifier counselorSignNotifier,
      MemberSignNotifier memberSignNotifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "이메일",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                hint: "이메일을 입력하세요",
                controller: emailController,
                onChanged: (value) =>
                    counselorSignNotifier.updateForm(email: value),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () async {
                final inputEmail = emailController.text;
                if (!EmailValidationUtil.isValidEmail(inputEmail)) {
                  SnackBarUtil.showError(context, "올바른 이메일 형식이 아닙니다.");
                  return; // 유효하지 않으면 여기서 로직 종료
                }

                final result =
                    await memberSignNotifier.isEmailCheck(inputEmail);
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

                  await memberSignNotifier.sendCode(inputEmail);

                  SnackBarUtil.showSuccess(context, "인증 코드가 이메일로 전송되었습니다.");
                }
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              ),
              child: const Text("중복 확인"),
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildCodeField(MemberSignNotifier memberSignNotifier) {
    return Row(
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
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          ),
          child: const Text("코드 확인"),
        ),
      ],
    );
  }

  Widget _buildGenderField(CounselorSignNotifier counselorSignNotifier) {
    return Row(
      children: [
        Expanded(
          child: CheckboxListTile(
            title: const Text("남성"),
            value: selectedGender == "남성",
            onChanged: (value) {
              setState(() {
                selectedGender = value! ? "남성" : null;
                counselorSignNotifier.updateForm(gender: selectedGender);
              });
            },
          ),
        ),
        Expanded(
          child: CheckboxListTile(
            title: const Text("여성"),
            value: selectedGender == "여성",
            onChanged: (value) {
              setState(() {
                selectedGender = value! ? "여성" : null;
                counselorSignNotifier.updateForm(gender: selectedGender);
              });
            },
          ),
        ),
      ],
    );
  }

  // 텍스트폼 빌더
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
