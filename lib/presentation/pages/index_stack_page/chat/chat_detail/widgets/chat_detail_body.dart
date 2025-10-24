import 'package:flutter/material.dart';
import 'chat_detail_item.dart';

class ChatDetailBody extends StatefulWidget {
  const ChatDetailBody({super.key});

  @override
  State<ChatDetailBody> createState() => _ChatDetailBodyState();
}

class _ChatDetailBodyState extends State<ChatDetailBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          ChatDetailItem(
            message:
                '첫번쨰 메세지입니다첫번쨰 메세지입니다첫번쨰 메세지입니다첫번쨰 메세지입니다첫번쨰 메세지입니다첫번쨰 메세지입니다첫번쨰 메세지입니다첫번쨰 메세지입니다',
          ),
          ChatDetailItem(
            message: '두번째 메세지입니다asdasdsadsadsadasdsadadasdsadasdsad',
            isMe: true,
          ),
        ],
      ),
    );
  }
}
