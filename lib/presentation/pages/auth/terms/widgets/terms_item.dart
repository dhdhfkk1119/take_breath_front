// terms_item.dart (예시 파일명)

import 'package:flutter/material.dart';

class TermsItem extends StatelessWidget {
  final String title;
  final String dialogTitle;
  final String dialogContent;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const TermsItem({
    super.key,
    required this.title,
    required this.dialogTitle,
    required this.dialogContent,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.leading, // 체크박스 왼쪽
      contentPadding: EdgeInsets.zero,
      secondary: IconButton(
        icon:
            const Icon(Icons.keyboard_arrow_right), // 아이콘 변경 (오른쪽 화살표가 더 자연스러움)
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(dialogTitle),
              content: SingleChildScrollView(
                child: Text(dialogContent),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("닫기"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
