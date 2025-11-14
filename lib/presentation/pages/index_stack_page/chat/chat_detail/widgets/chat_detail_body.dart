import 'package:flutter/material.dart';
import 'package:take_breath/domain/chat/models/chat_message_ui/chat_message_ui.dart';
import 'package:take_breath/presentation/pages/index_stack_page/chat/chat_detail/widgets/chat_message_bubble.dart';

class ChatDetailBody extends StatelessWidget {
  final List<ChatMessageUI> messages;
  final ScrollController scrollController;

  const ChatDetailBody(
      {super.key, required this.messages, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      reverse: false,
      padding: const EdgeInsets.all(12),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final msg = messages[index];

        return ChatMessageBubble(
          isMe: msg.isMe,
          message: msg.content,
          messageType: msg.message.messageType,
          showProfile: msg.showProfile,
          showTimestamp: msg.showTimestamp,
          senderName: msg.senderName,
          formattedTime: msg.formattedTime,
          attachmentPath: msg.attachmentPath,
        );
      },
    );
  }
}