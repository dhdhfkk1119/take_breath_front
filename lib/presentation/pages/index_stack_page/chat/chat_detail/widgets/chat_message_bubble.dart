import 'package:flutter/material.dart';


class ChatMessageBubble extends StatelessWidget {
  final bool isMe;
  final String message;
  final String messageType;
  final bool showProfile;        
  final bool showTimestamp;      
  final String senderName;       
  final String formattedTime;  
  final String? imageUrl;        

  const ChatMessageBubble({
    super.key,
    required this.isMe,
    required this.message,
    required this.messageType,
    required this.showProfile,
    required this.showTimestamp,
    required this.senderName,
    required this.formattedTime,
    this.imageUrl,
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
          // ✅ 프로필 이미지 (타인 메시지 + showProfile)
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

          // ✅ 프로필 없을 때 공간 유지 (정렬용)
          if (!isMe && !showProfile)
            const SizedBox(width: 44),  // CircleAvatar 크기만큼

          // 메시지 컬럼
          Flexible(
            child: Column(
              crossAxisAlignment: isMe
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                // ✅ 발신자 이름 (타인 메시지 + showProfile)
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
                    // ✅ 시간 표시 (내 메시지 + showTimestamp)
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
                    Container(
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
                      child: messageType == 'IMAGE' && imageUrl != null
                          ? _buildImageMessage()
                          : _buildTextMessage(),
                    ),

                    // ✅ 시간 표시 (타인 메시지 + showTimestamp)
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

  Widget _buildTextMessage() {
    return Text(
      message,
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
            imageUrl!,
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
        if (message.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            message,
            style: TextStyle(
              color: isMe ? Colors.white : Colors.black87,
              fontSize: 14,
            ),
          ),
        ],
      ],
    );
  }
}

/*

class ChatMessageBubble extends StatelessWidget {
  final bool isMe;
  final String message;
  final String messageType;
  final bool showProfile;
  final bool showTimestamp;
  final String senderName;
  final String formattedTime;
  final String? imageUrl;

  const ChatMessageBubble({
    super.key,
    required this.isMe,
    required this.message,
    required this.messageType,
    required this.showProfile,
    required this.showTimestamp,
    required this.senderName,
    required this.formattedTime,
    this.imageUrl,
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

*/