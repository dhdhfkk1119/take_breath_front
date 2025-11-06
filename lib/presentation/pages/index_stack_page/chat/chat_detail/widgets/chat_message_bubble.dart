import 'package:flutter/material.dart';


class ChatMessageBubble extends StatelessWidget {
  final bool isMe;
  final String message;
  final String messageType;

  const ChatMessageBubble({
    super.key,
    required this.isMe,
    required this.message,
    required this.messageType,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isMe ? Colors.blue[300]! : Colors.grey[300]!;
    final align = isMe ? Alignment.centerRight : Alignment.centerLeft;

    return Align(
      alignment: align,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: messageType == "IMAGE"
            ? Image.network(message)
            : Text(message),
      ),
    );
  }
}