import 'package:flutter/material.dart';

class CustomTextArea extends StatelessWidget {
  final String? initValue; // 초기 값 - 글 쓰기
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomTextArea({
    Key? key,
    this.initValue = "",
    required this.hint,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (initValue != null && initValue!.isNotEmpty) {
      controller.text = initValue!;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        validator: validator,
        controller: controller,
        maxLines: 10,
        decoration: InputDecoration(
          hintText: "$hint",
          enabledBorder: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(),
          errorBorder: OutlineInputBorder(),
          focusedErrorBorder: OutlineInputBorder(),
        ),
      ),
    );
  }
}
