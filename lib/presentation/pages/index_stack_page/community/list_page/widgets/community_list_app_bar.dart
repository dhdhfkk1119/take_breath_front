import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_breath/_core/constants/custom_widget.dart';
import 'package:take_breath/presentation/pages/notification/notification_page.dart';

import '../../../../../../_core/constants/custom_color.dart';

class CommunityListAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback? onSearchPressed;

  const CommunityListAppBar({super.key, this.onSearchPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: brandAppBarColor,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          CustomWidget.buildTitle(
            "커뮤니티",
            weight: FontWeight.bold,
            size: 20,
          ),
          const SizedBox(width: 4),
        ],
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(CupertinoIcons.list_bullet),
          onPressed: () {
            Scaffold.of(context).openDrawer(); // 부모 Scaffold 찾기
          },
        ),
        IconButton(
          icon: const Icon(CupertinoIcons.search),
          onPressed: onSearchPressed,
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

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
