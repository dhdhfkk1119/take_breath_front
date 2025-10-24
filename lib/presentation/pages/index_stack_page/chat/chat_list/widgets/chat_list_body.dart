import 'package:flutter/material.dart';
import 'package:take_breath/_core/constants/custom_color.dart';
import 'package:take_breath/_core/utils/selectable_button.dart';
import 'package:take_breath/presentation/pages/index_stack_page/chat/chat_list/widgets/chat_list_item.dart';

class ChatListBody extends StatefulWidget {
  const ChatListBody({super.key});

  @override
  State<ChatListBody> createState() => _ChatListBodyState();
}

class _ChatListBodyState extends State<ChatListBody> {
  @override
  Widget build(BuildContext context) {
    String selected = "전체";

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Row(
            children: [
              SelectableButton(
                label: "전체",
                isSelected: selected == "전체",
                activeColor: brandBackColor,
                onTap: () => setState(() => selected = "전체"),
              ),
              const SizedBox(width: 8),
              SelectableButton(
                label: "안 읽음",
                isSelected: selected == "안 읽음",
                activeColor: brandBackColor,
                onTap: () => setState(() => selected = "안 읽음"),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          ChatListItem(),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
