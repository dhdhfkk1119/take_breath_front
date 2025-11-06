import 'package:flutter/material.dart';

class ChatDetailItem extends StatelessWidget {
  final String message;
  final bool isMe;
  final String? messageType; // "TEXT", "IMAGE" 등
  final String? imageUrl;
  final String createdAt;

  const ChatDetailItem({
    super.key,
    required this.message,
    required this.isMe,
    this.messageType,
    this.imageUrl,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    final isImage = messageType == "IMAGE";

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isMe)
            const CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage("assets/basic.png"),
            ),
          const SizedBox(width: 8),
          Flexible(
            child: Column(
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: isImage
                      ? EdgeInsets.zero
                      : const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 14,
                        ),
                  decoration: BoxDecoration(
                    color: isMe ? Colors.blue : Colors.grey[300],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: isImage
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            imageUrl ?? "",
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Text(
                          message,
                          style: TextStyle(
                            color: isMe ? Colors.white : Colors.black87,
                            fontSize: 15,
                          ),
                        ),
                ),
                if (createdAt != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Text(
                      createdAt!,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 11,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*
class ChatDetailItem extends StatelessWidget {
  final String message;
  final bool isMe;

  const ChatDetailItem({super.key, required this.message, this.isMe = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start, // 좌/우 정렬
        children: [
          if (isMe == false && message != null)
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                image: const DecorationImage(
                  image: AssetImage("assets/basic.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          const SizedBox(width: 8),
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.6,
            ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: isMe ? Colors.blue : Colors.grey[300],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              message,
              style: TextStyle(
                color: isMe ? Colors.white : Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/
