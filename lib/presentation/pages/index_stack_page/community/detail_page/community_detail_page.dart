import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_breath/_core/constants/custom_color.dart';
import 'package:take_breath/_core/constants/custom_showDialog.dart';
import 'package:take_breath/_core/constants/custom_text_form_field.dart';
import 'package:take_breath/_core/utils/widgets_app_bar.dart';
import 'package:take_breath/presentation/pages/index_stack_page/community/detail_page/widgets/community_detail_item.dart';

class CommunityDetailPage extends StatelessWidget {
  const CommunityDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController commentController = TextEditingController();

    return Scaffold(
      appBar: WidgetsAppBar(
        title: "상세 페이지",
        icon: const Icon(Icons.more_vert),
        menuItems: [
          BottomMenuItem(
            title: "신고하기",
            icon: const Icon(Icons.report),
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
            icon: const Icon(Icons.edit, color: Colors.blue),
            onTap: () {},
          ),
          BottomMenuItem(
            title: "삭제",
            icon: const Icon(Icons.delete, color: Colors.red),
            onTap: () {},
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          // 게시글 본문
          const Expanded(child: CommunityDetailItem()),

          // 댓글 입력창
          AnimatedPadding(
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeOut,
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SafeArea(
              top: false,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 45,
                        child: CustomTextFormField(
                          controller: commentController,
                          hint: "댓글 달기",
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.send),
                      color: brandBackColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
