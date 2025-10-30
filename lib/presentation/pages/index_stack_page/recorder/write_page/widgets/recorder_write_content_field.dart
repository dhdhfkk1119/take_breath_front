import 'package:flutter/material.dart';

class RecorderWriteContentField extends StatelessWidget {
  final TextEditingController controller;

  const RecorderWriteContentField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(fontSize: 16),
      decoration: const InputDecoration(
        hintText: '오늘 있었던 일을 기록해보세요...',
        border: InputBorder.none,
      ),
      maxLines: null,
      minLines: 10,
    );
  }
}
