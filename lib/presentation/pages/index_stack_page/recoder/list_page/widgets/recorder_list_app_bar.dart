import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../../_core/utils/notification/notification_page..dart';

class RecorderListAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback onFilterToggle;
  final VoidCallback onSearchToggle;
  final Function(DateTime?) onDateSelected;

  const RecorderListAppBar({
    super.key,
    required this.onFilterToggle,
    required this.onSearchToggle,
    required this.onDateSelected,
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
            _showDatePicker(context);
          },
        ),
        IconButton(
          icon: const Icon(CupertinoIcons.search),
          onPressed: onSearchToggle,
        ),
        IconButton(
          icon: const Icon(CupertinoIcons.bell_fill),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NotificationPage(),
              ),
            );
          },
        ),
      ],
    );
  }

  void _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      locale: const Locale('ko', 'KR'),
    ).then((selectedDate) {
      if (selectedDate != null) {
        onDateSelected(selectedDate);
      }
    });
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
