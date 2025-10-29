import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RecorderListAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback onSearchPressed;
  final VoidCallback onCalendarPressed;
  final VoidCallback onFilterPressed;
  final VoidCallback onNotificationPressed;

  const RecorderListAppBar({
    super.key,
    required this.onSearchPressed,
    required this.onCalendarPressed,
    required this.onFilterPressed,
    required this.onNotificationPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: const Text(
        '기록실',
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(CupertinoIcons.calendar, color: Colors.black),
          onPressed: onCalendarPressed,
          tooltip: '날짜 선택',
        ),
        IconButton(
          icon:
              const Icon(CupertinoIcons.line_horizontal_3, color: Colors.black),
          onPressed: onFilterPressed,
          tooltip: '필터',
        ),
        IconButton(
          icon: const Icon(Icons.search, color: Colors.black),
          onPressed: onSearchPressed,
          tooltip: '검색',
        ),
        IconButton(
          icon: const Icon(CupertinoIcons.bell, color: Colors.black),
          onPressed: onNotificationPressed,
          tooltip: '알림',
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
