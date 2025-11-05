import 'package:flutter/material.dart';

import 'chat_detail_item.dart';

class ChatDetailBody extends StatelessWidget {
  final List<Map<String, dynamic>> messages;

  const ChatDetailBody({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final msg = messages[index];
        return ChatDetailItem(
          message: msg['message'] ?? '',
          isMe: msg['isMe'] ?? false,
        );
      },
    );
  }
}