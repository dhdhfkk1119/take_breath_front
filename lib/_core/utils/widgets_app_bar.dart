import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_breath/_core/constants/custom_widget.dart';

class WidgetsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final title;
  const WidgetsAppBar({super.key, required this.title});

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
        title,
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
