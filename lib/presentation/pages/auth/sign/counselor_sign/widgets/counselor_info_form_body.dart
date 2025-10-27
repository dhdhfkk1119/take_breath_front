import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:take_breath/_core/constants/custom_color.dart';
import 'package:take_breath/_core/constants/custom_text_form_field.dart';

class CounselorInfoFormBody extends StatefulWidget {
  final VoidCallback onRemove;

  const CounselorInfoFormBody({super.key, required this.onRemove});

  @override
  State<CounselorInfoFormBody> createState() => _CounselorInfoFormBodyState();
}

class _CounselorInfoFormBodyState extends State<CounselorInfoFormBody> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  final TextEditingController levelController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _removeImage() {
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(color: brandBackColor ?? Colors.grey),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: _image != null
                        ? Image.file(_image!, fit: BoxFit.cover)
                        : const Icon(Icons.camera_alt),
                  ),
                ),
              ),
              if (_image != null)
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: _removeImage, // 이미지 제거 메서드 연결
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black, // 배경색으로 X 버튼을 더 잘 보이게 함
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(2), // 버튼 주변 여백
                      child: const Icon(
                        Icons.close,
                        size: 12, // 아이콘 크기 조정
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            controller: levelController,
            decoration: const InputDecoration(labelText: "자격증 등급/레벨"),
          ),
          CustomTextFormField(
            controller: numberController,
            decoration: const InputDecoration(labelText: "자격증 번호"),
          ),
          CustomTextFormField(
            controller: nameController,
            decoration: const InputDecoration(labelText: "자격증 이름"),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.red),
              onPressed: widget
                  .onRemove, // 부모 위젯(_CounselorSignBodyState)에서 전달받은 제거 함수 호출
            ),
          ),
        ],
      ),
    );
  }
}
