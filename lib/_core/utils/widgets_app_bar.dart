import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_breath/_core/constants/custom_color.dart';
import 'package:take_breath/_core/constants/custom_widget.dart';
import 'package:take_breath/_core/constants/custom_showDialog.dart';

class WidgetsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Icon? icon;
  final List<BottomMenuItem>? menuItems;

  const WidgetsAppBar({
    super.key,
    required this.title,
    this.icon,
    this.menuItems,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: brandAppBarColor,
      automaticallyImplyLeading: false,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(CupertinoIcons.back, color: Colors.black),
      ),
      title: CustomWidget.buildTitle(
        title,
        weight: FontWeight.bold,
        size: 20,
      ),
      centerTitle: true,
      actions: [
        if (icon != null)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(12.0),
              onTap: () {
                if (menuItems != null && menuItems!.isNotEmpty) {
                  showBottomMenu(
                    context: context,
                    items: menuItems!,
                  );
                }
              },
              child: icon!,
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
