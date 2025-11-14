import 'package:flutter/material.dart';


class ChatMessageBubble extends StatelessWidget {
  final bool isMe;
  final String? message;
  final String messageType;
  final bool showProfile;
  final bool showTimestamp;
  final String senderName;
  final String formattedTime;
  final String? attachmentPath;

  const ChatMessageBubble({
    super.key,
    required this.isMe,
    this.message,
    required this.messageType,
    required this.showProfile,
    required this.showTimestamp,
    required this.senderName,
    required this.formattedTime,
    this.attachmentPath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: isMe
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 프로필 이미지
          if (!isMe && showProfile)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: CircleAvatar(
                radius: 18,
                child: Text(
                  senderName.isNotEmpty ? senderName[0] : '?',
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ),

          // 프로필 없을 때
          if (!isMe && !showProfile)
            const SizedBox(width: 44),

          // 메시지 컬럼
          Flexible(
            child: Column(
              crossAxisAlignment: isMe
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                // 발신자 이름
                if (!isMe && showProfile)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4, left: 4),
                    child: Text(
                      senderName,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                // 메시지 버블
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // 시간 표시
                    if (isMe && showTimestamp)
                      Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: Text(
                          formattedTime,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),

                    // 메시지 내용
                    _buildMessageContent(context),

                    // 타인 시간 표시
                    if (!isMe && showTimestamp)
                      Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Text(
                          formattedTime,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageContent(BuildContext context) {
    switch (messageType) {
      case 'IMAGE':
        return _buildImageMessage();
      case 'TEXT':
        return _messageBubble(context);
      default:
        return _messageBubble(context);
    }
  }

  Widget _messageBubble(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.7,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: isMe ? Colors.blue : Colors.grey[300],
        borderRadius: BorderRadius.circular(16),
      ),
      child: _buildTextMessage(),
    );
  }

  Widget _buildTextMessage() {
    return Text(
      message ?? '',
      style: TextStyle(
        color: isMe ? Colors.white : Colors.black87,
        fontSize: 14,
      ),
    );
  }

  Widget _buildImageMessage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            "http://10.0.2.2:8080${attachmentPath!}",
            width: 200,
            height: 200,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 200,
                height: 200,
                color: Colors.grey[400],
                child: const Icon(Icons.error),
              );
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                width: 200,
                height: 200,
                color: Colors.grey[300],
                child: Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                ),
              );
            },
          ),
        ),

      ],
    );
  }
}