import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RecorderWriteAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback onSave;

  const RecorderWriteAppBar({
    Key? key,
    required this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(CupertinoIcons.back),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text('기록 작성'),
      actions: [
        TextButton(
          onPressed: onSave,
          child: const Text(
            '완료',
            style: TextStyle(
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
