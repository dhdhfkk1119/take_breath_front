import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/constants/custom_color.dart';
import 'package:take_breath/_core/utils/selectable_button.dart';
import 'package:take_breath/domain/chat/providers/chat_room_list_notifier.dart';
import 'package:take_breath/presentation/pages/index_stack_page/chat/chat_list/widgets/chat_list_item.dart';

class ChatListBody extends ConsumerStatefulWidget {
  const ChatListBody({super.key});

  @override
  ConsumerState<ChatListBody> createState() => _ChatListBodyState();
}

class _ChatListBodyState extends ConsumerState<ChatListBody> {
  String selected = "전체"; // 클래스 멤버 변수

  @override
  Widget build(BuildContext context) {
    final chatListState = ref.watch(chatRoomListProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
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
          SizedBox(height: 16),
          Expanded(
            child: chatListState.when(
              data: (chatRooms) {
                // 필터링
                final filteredRooms = selected == "안 읽음"
                    ? chatRooms.where((room) => room.unreadCount > 0).toList()
                    : chatRooms;

                if (filteredRooms.isEmpty) {
                  return Center(
                    child: Text(
                      selected == "안 읽음" ? "읽지 않은 채팅이 없습니다" : "채팅이 없습니다",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  );
                }

                return ListView.separated(
                  itemCount: filteredRooms.length,
                  separatorBuilder: (context, index) =>
                  const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final chatRoom = filteredRooms[index];
                    return ChatListItem();
                  },
                );
              },
              loading: () =>
              const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stackTrace) =>
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error_outline,
                            size: 48, color: Colors.grey),
                        const SizedBox(height: 16),
                        Text(
                          "채팅 목록을 불러올 수 없습니다",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 8),
                        TextButton(
                            onPressed: () {
                              ref.invalidate(chatRoomListProvider);
                            },
                            child: const Text("다시 시도")
                        ),
                      ],
                    ),
                  ),
            ),
          ),
          ChatListItem(),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

/*

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

*/
