import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RecorderListAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback onFilterToggle;
  final VoidCallback onSearchToggle;

  const RecorderListAppBar({
    super.key,
    required this.onFilterToggle,
    required this.onSearchToggle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text(
        "기록실",
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(CupertinoIcons.list_bullet),
          onPressed: onFilterToggle,
        ),
        IconButton(
          icon: const Icon(CupertinoIcons.calendar),
          onPressed: () {
            // TODO: 캘린더 뷰 토글
          },
        ),
        IconButton(
          icon: const Icon(CupertinoIcons.search),
          onPressed: onSearchToggle,
        ),
        IconButton(
          icon: const Icon(CupertinoIcons.bell_fill),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
