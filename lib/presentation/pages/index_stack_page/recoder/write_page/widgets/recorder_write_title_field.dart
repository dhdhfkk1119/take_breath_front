import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RecorderWriteTitleField extends StatelessWidget {
  final TextEditingController controller;

  const RecorderWriteTitleField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          decoration: const InputDecoration(
            hintText: '제목을 입력하세요',
            border: InputBorder.none,
          ),
          maxLines: 1,
        ),
        const Divider(),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(
              CupertinoIcons.calendar,
              size: 16,
              color: Colors.grey[600],
            ),
            const SizedBox(width: 8),
            Text(
              _getCurrentDate(),
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _getCurrentDate() {
    final now = DateTime.now();
    return '${now.year}.${now.month.toString().padLeft(2, '0')}.${now.day.toString().padLeft(2, '0')}';
  }
}
