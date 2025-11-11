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
          // ✅ ChatMessageUI의 isMe
          message: msg.content,
          // ✅ getter로 접근
          messageType: msg.message.messageType,
          // ✅ 원본 필드 접근
          showProfile: msg.showProfile,
          // ✅ 프로필 표시 여부
          showTimestamp: msg.showTimestamp,
          // ✅ 시간 표시 여부
          senderName: msg.senderName,
          // ✅ 발신자 이름
          formattedTime: msg.formattedTime,
          // ✅ 포맷된 시간
          attachmentPath: msg.attachmentPath, // ✅ 이미지 URL (있으면)
        );
      },
    );
  }
}

/*

class ChatDetailBody extends StatelessWidget {
  final List<ChatMessageUI> messages;
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

*/
