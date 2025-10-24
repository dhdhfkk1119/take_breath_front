import 'package:flutter/material.dart';

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
          SizedBox(
            width: 8,
          ),
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
                  color: isMe ? Colors.white : Colors.black, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
