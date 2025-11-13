import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../../_core/constants/custom_color.dart';

class RecorderDetailAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final VoidCallback onExport;

  const RecorderDetailAppBar({
    Key? key,
    required this.onDelete,
    required this.onEdit,
    required this.onExport,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: brandAppBarColor,
      surfaceTintColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(CupertinoIcons.back),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text('기록 상세'),
      actions: [
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () => _showOptionsMenu(context),
        ),
      ],
    );
  }

  void _showOptionsMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(CupertinoIcons.pencil),
              title: const Text('수정하기'),
              onTap: () {
                Navigator.pop(context);
                onEdit();
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.down_arrow),
              title: const Text('다운로드'),
              onTap: () {
                Navigator.pop(context);
                onExport();
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.trash, color: Colors.red),
              title: const Text('삭제하기', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(context);
                onDelete();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
