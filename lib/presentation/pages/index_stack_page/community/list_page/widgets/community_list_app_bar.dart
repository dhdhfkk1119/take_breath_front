import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_breath/presentation/pages/index_stack_page/community/list_page/widgets/community_list_filter.dart';

class CommunityListAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CommunityListAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Text("커뮤니티",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              )),
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
          onPressed: () {},
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
