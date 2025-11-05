import 'package:flutter/material.dart';
import 'package:take_breath/_core/constants/custom_color.dart';
import 'package:take_breath/domain/chat/models/chat_room_list_response.dart';
import 'package:take_breath/presentation/pages/index_stack_page/chat/chat_detail/chat_detail_page.dart';

class ChatListItem extends StatefulWidget {
  final ChatRoomListResponse chatRoomListResponse;

  const ChatListItem({
    super.key,
    required this.chatRoomListResponse,
  });

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
            builder: (context) => ChatDetailPage(
              roomId: widget.chatRoomListResponse.roomId,
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 프로필 이미지
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
          SizedBox(width: 8),
          // 이름 & 마지막 메세지
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // widget.chatRoomListResponse.otherMemberName,
                  widget.chatRoomListResponse.roomName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  widget.chatRoomListResponse.lastMessage ?? "",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),

          // 시간 & 읽지 않은 메세지 갯수
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.chatRoomListResponse.lastMessageTime ?? "",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 4),

              // 읽지 않은 메세지가 있을 때만 표시
              if (widget.chatRoomListResponse.unreadCount > 0)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  constraints: const BoxConstraints(
                    minWidth: 20,
                    minHeight: 20,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: brandBackColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    widget.chatRoomListResponse.unreadCount > 999
                        ? "999+"
                        : "${widget.chatRoomListResponse.unreadCount}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
