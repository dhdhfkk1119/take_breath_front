import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:take_breath/_core/constants/custom_color.dart';
import 'package:take_breath/_core/constants/custom_text_button.dart';
import 'package:take_breath/_core/constants/custom_text_form_field.dart';
import 'package:take_breath/presentation/pages/auth/terms/terms_page.dart';

import 'counselor_info_form_body.dart';

class CounselorSignBody extends StatefulWidget {
  const CounselorSignBody({super.key});

  @override
  State<CounselorSignBody> createState() => _CounselorSignBodyState();
}

class _CounselorSignBodyState extends State<CounselorSignBody> {
  // 컨트롤러들
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
  String? selectedGender; // 성별 선택 (남 or 여)
  File? _profileImage; // 로컬에서 선택한 이미지 파일
  final List<CounselorInfoFormBody> _licenseForms = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
          _buildEmailField(),
          buildTextFormField("인증코드", codeController, enabled: isCodeEnabled),
          buildTextFormField("상담사 닉네임", nicknameController),
          buildTextFormField("비밀번호", passwordController, obscureText: true),
          buildTextFormField("비밀번호 확인", passwordCheckController,
              obscureText: true),
          buildTextFormField("이름", nameController),
          buildTextFormField(
            "핸드폰 번호",
            phoneController,
            inputFormatters: [phoneMaskFormatter],
            keyboardType: TextInputType.phone,
          ),
          buildTextFormField("주소", addressController),
          const SizedBox(height: 12),
          const Text(
            "성별",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Expanded(
                child: CheckboxListTile(
                  title: const Text("남성"),
                  value: selectedGender == "남성",
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value! ? "남성" : null;
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
                    });
                  },
                ),
              ),
            ],
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
                onPressed: () {
                  final UniqueKey newKey = UniqueKey();

                  setState(() {
                    final newForm = CounselorInfoFormBody(
                      key: newKey,
                      onRemove: () {
                        setState(() {
                          _licenseForms.removeWhere((element) =>
                              element.key == newKey); // Key로 해당 요소를 찾습니다.
                        });
                      },
                    );
                    _licenseForms.add(newForm);
                  });
                },
              )
            ],
          ),
          Column(children: _licenseForms),
          CustomTextButton(
            text: "회원가입",
            click: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TermsPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  // 이메일 필드 + 인증 버튼
  Widget _buildEmailField() {
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
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isCodeEnabled = true;
                });
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              ),
              child: const Text("이메일 인증"),
            ),
          ],
        ),
        const SizedBox(height: 8),
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
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
