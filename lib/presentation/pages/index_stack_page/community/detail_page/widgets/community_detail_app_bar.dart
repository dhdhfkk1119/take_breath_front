import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_breath/_core/constants/custom_color.dart';
import 'package:take_breath/_core/constants/custom_showDialog.dart';
import 'package:take_breath/_core/constants/custom_widget.dart';

class CommunityDetailAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback? onSearchPressed;

  const CommunityDetailAppBar({super.key, this.onSearchPressed});

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
        "상세 페이지",
        weight: FontWeight.bold,
        size: 20,
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            showBottomMenu(
              context: context,
              items: [
                BottomMenuItem(
                  title: "신고하기",
                  icon: Icon(
                    Icons.report,
                  ),
                  onTap: () {
                    showReportBottomSheet(
                      context: context,
                      onReport: () {},
                      postId: 1,
                    );
                  },
                ),
                BottomMenuItem(
                  title: "수정",
                  icon: Icon(
                    Icons.edit,
                    color: brandBackColor,
                  ),
                  onTap: () {},
                ),
                BottomMenuItem(
                  title: "삭제",
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onTap: () {
                    // 내 번호, 게시물 번호 넘기기
                  },
                ),
              ],
            );
          },
          icon: Icon(Icons.more_vert),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
