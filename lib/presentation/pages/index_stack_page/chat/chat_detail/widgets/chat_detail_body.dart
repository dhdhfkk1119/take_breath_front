import 'package:flutter/material.dart';
import 'package:take_breath/domain/chat/models/chat_message_response.dart';
import 'package:take_breath/presentation/pages/index_stack_page/chat/chat_detail/widgets/chat_message_bubble.dart';

import 'chat_detail_item.dart';

class ChatDetailBody extends StatelessWidget {
  final List<ChatMessageResponse> messages;
  const ChatDetailBody({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      padding: const EdgeInsets.all(12),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final msg = messages[index];
        return ChatMessageBubble(
          isMe: msg.isMe,
          message: msg.content,
          messageType: msg.messageType,
        );
      },
    );
  }
}


/*

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

*/
