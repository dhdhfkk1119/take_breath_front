import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_breath/_core/constants/custom_widget.dart';

class CommunityWriteAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CommunityWriteAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(CupertinoIcons.back, color: Colors.black),
      ),
      title: CustomWidget.buildTitle(
        "공유 글 작성",
        weight: FontWeight.bold,
        size: 20,
      ),
      centerTitle: true,
      actions: [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
