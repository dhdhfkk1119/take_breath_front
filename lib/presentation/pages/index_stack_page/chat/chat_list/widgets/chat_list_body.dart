import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/constants/custom_color.dart';
import 'package:take_breath/_core/utils/selectable_button.dart';
import 'package:take_breath/domain/chat/models/chat_filter.dart';
import 'package:take_breath/domain/chat/providers/chat_room_list_notifier.dart';
import 'package:take_breath/presentation/pages/index_stack_page/chat/chat_list/widgets/chat_list_item.dart';

class ChatListBody extends ConsumerStatefulWidget {
  const ChatListBody({super.key});

  @override
  ConsumerState<ChatListBody> createState() => _ChatListBodyState();
}

class _ChatListBodyState extends ConsumerState<ChatListBody> {
  ChatFilter selected = ChatFilter.all; // 클래스 멤버 변수

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
                label: ChatFilter.all.label,
                isSelected: selected == ChatFilter.all,
                activeColor: brandBackColor,
                onTap: () => setState(() => selected = ChatFilter.all),
              ),
              const SizedBox(width: 8),
              SelectableButton(
                label: ChatFilter.unread.label,
                isSelected: selected == ChatFilter.unread,
                activeColor: brandBackColor,
                onTap: () => setState(() => selected = ChatFilter.unread),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(chatRoomListProvider); // provider 무효화
                await ref.read(chatRoomListProvider.future); // 새로고침이 완료될 때까지 대기
              },
              child: chatListState.when(
                data: (chatRooms) {
                  // 필터링 (selected가 unread인 경우 unreadCount가 0이 아닌 채팅만 필터링)
                  final filteredRooms = selected == ChatFilter.unread
                      ? chatRooms.where((room) => room.unreadCount > 0).toList()
                      : chatRooms;

                  // 필터링 (방이 없는 경우)
                  if (filteredRooms.isEmpty) {
                    return Center(
                      child: Text(
                        selected == ChatFilter.unread
                            ? "읽지 않은 채팅이 없습니다"
                            : "채팅이 없습니다",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    );
                  }

                  // 실제 데이터 목록 - 이게 뜰때만 리프레시 가능함
                  return ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: filteredRooms.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final chatRoom = filteredRooms[index];
                      return ChatListItem(chatRoomListResponse: chatRoom);
                    },
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (error, stackTrace) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 48,
                        color: Colors.grey,
                      ),
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
                        child: const Text("다시 시도"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
