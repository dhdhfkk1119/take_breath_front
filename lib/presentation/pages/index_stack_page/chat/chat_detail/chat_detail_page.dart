import 'package:flutter/material.dart';
import 'package:take_breath/_core/constants/custom_showDialog.dart';
import 'package:take_breath/_core/utils/widgets_app_bar.dart';
import 'package:take_breath/presentation/pages/index_stack_page/chat/chat_detail/widgets/chat_detail_body.dart';

import 'widgets/chat_detail_bottom.dart';

class ChatDetailPage extends StatelessWidget {
  const ChatDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetsAppBar(
        title: "정우방",
        icon: Icon(Icons.more_vert),
        menuItems: [
          BottomMenuItem(
              title: "상담 종료하기",
              icon: const Icon(
                Icons.door_back_door_outlined,
                color: Colors.redAccent,
              ),
              onTap: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ChatDetailBody(),
          ),
          ChatDetailBottom(),
        ],
      ),
    );
  }
}
