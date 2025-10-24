import 'package:flutter/material.dart';
import 'package:take_breath/_core/constants/custom_color.dart';
import 'package:take_breath/presentation/pages/index_stack_page/chat/chat_detail/chat_detail_page.dart';

class ChatListItem extends StatefulWidget {
  const ChatListItem({super.key});

  @override
  State<ChatListItem> createState() => _ChatListItemState();
}

class _ChatListItemState extends State<ChatListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetailPage(),
          ),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "상담사 이름",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("마지막 메세지 내용"),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("오전 1시 10분"),
              Container(
                width: 20,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: brandBackColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  "7",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
