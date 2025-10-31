import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:take_breath/_core/constants/custom_color.dart';
import 'package:take_breath/_core/constants/custom_text_form_field.dart';
import 'package:take_breath/domain/counselor/models/counselor_license_request.dart';
import 'package:take_breath/domain/counselor/providers/counselor_sign_notifier.dart';

class CounselorInfoFormBody extends ConsumerStatefulWidget {
  final VoidCallback onRemove;
  final CounselorLicenseRequest license;

  CounselorInfoFormBody({
    super.key,
    required this.onRemove,
    required this.license,
  });

  @override
  ConsumerState<CounselorInfoFormBody> createState() =>
      _CounselorInfoFormBodyState();
}

class _CounselorInfoFormBodyState extends ConsumerState<CounselorInfoFormBody> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  late final TextEditingController nameController;
  late final TextEditingController numberController;
  late final TextEditingController regiNumberController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.license.licenseName);
    numberController =
        TextEditingController(text: widget.license.licenseNumber);
    regiNumberController = TextEditingController(
        text: widget.license.licenseRegiNumber); // '자격증 등급/레벨' 대신 등록번호로 사용

    if (widget.license.licenseImage.isNotEmpty) {
      _image = File(widget.license.licenseImage);
    }
  }

  void _triggerUpdate({
    String? name,
    String? number,
    String? regiNumber,
    String? imagePath,
  }) {
    final newLicense = widget.license.copyWith(
      licenseName: name ?? nameController.text,
      licenseNumber: number ?? numberController.text,
      licenseRegiNumber: regiNumber ?? regiNumberController.text,
      licenseImage: imagePath ?? _image?.path ?? widget.license.licenseImage,
    );

    ref.read(counselorSignProvider.notifier).updateLicense(newLicense);
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      _triggerUpdate(imagePath: pickedFile.path);
    }
  }

  void _removeImage() {
    setState(() {
      _image = null;
    });
    _triggerUpdate(imagePath: '');
  }

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    regiNumberController.dispose();
    super.dispose();
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
                      decoration: const BoxDecoration(
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
            controller: nameController,
            decoration: const InputDecoration(labelText: "자격증 이름"),
            onChanged: (value) => _triggerUpdate(name: value),
          ),
          CustomTextFormField(
            controller: numberController,
            decoration: const InputDecoration(labelText: "자격증 번호"),
            onChanged: (value) => _triggerUpdate(number: value),
          ),
          CustomTextFormField(
            controller: regiNumberController,
            decoration: const InputDecoration(labelText: "자격증 등록 번호"),
            onChanged: (value) => _triggerUpdate(regiNumber: value),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.red),
              onPressed: widget.onRemove,
            ),
          ),
        ],
      ),
    );
  }
}
