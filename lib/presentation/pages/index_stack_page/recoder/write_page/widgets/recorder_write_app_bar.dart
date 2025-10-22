import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RecorderWriteAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback onSave;
  final bool isEditMode;

  const RecorderWriteAppBar({
    Key? key,
    required this.onSave,
    this.isEditMode = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(CupertinoIcons.back),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(isEditMode ? '기록 수정' : '기록 작성'),
      actions: [
        TextButton(
          onPressed: onSave,
          child: Text(
            isEditMode ? '수정' : '완료',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0891B2),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
