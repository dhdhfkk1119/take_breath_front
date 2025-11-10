import 'package:flutter/material.dart';
import 'package:take_breath/_core/utils/widgets_app_bar.dart';
import 'package:take_breath/presentation/pages/index_stack_page/chat/chat_list/widgets/chat_list_body.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      appBar: WidgetsAppBar(
        title: "채팅방",
        icon: Icon(Icons.refresh),
      ),
      */
      appBar: AppBar(
        title: const Text("채팅"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ChatListBody(),
    );
  }
}
