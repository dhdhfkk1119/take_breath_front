import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/constants/custom_color.dart';
import 'package:take_breath/_core/utils/selectable_button.dart';
import 'package:take_breath/domain/chat/models/chat_filter.dart';
import 'package:take_breath/domain/chat/providers/chat_room_provider.dart';
import 'package:take_breath/presentation/pages/index_stack_page/chat/chat_list/widgets/chat_list_item.dart';

class ChatListBody extends ConsumerStatefulWidget {
  const ChatListBody({super.key});

  @override
  ConsumerState<ChatListBody> createState() => _ChatListBodyState();
}

class _ChatListBodyState extends ConsumerState<ChatListBody> {
  ChatFilter selected = ChatFilter.all;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // 스크롤이 80% 이상 내려갔을 때 다음 페이지 로드
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      final chatListState = ref.read(chatRoomProvider);

      // 로딩 중이 아니고, 다음 페이지가 있으면 로드
      if (chatListState.hasValue) {
        final state = chatListState.value!;
        if (!state.isLoadingMore && state.hasNext) {
          ref.read(chatRoomProvider.notifier).loadMore();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final chatListState = ref.watch(chatRoomProvider);

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
                await ref.read(chatRoomProvider.notifier).refresh();
              },
              child: chatListState.when(
                data: (state) {
                  final chatRooms = state.rooms;

                  // 필터링
                  final filteredRooms = selected == ChatFilter.unread
                      ? chatRooms.where((room) => room.unreadCount > 0).toList()
                      : chatRooms;

                  // 빈 상태
                  if (filteredRooms.isEmpty) {
                    return Center(
                      child: Text(
                        selected == ChatFilter.unread
                            ? "읽지 않은 채팅이 없습니다"
                            : "채팅이 없습니다",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    );
                  }

                  // 리스트 렌더링
                  return ListView.separated(
                    controller: _scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: filteredRooms.length + (state.hasNext ? 1 : 0),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      if (index == filteredRooms.length) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }

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
                      const Text(
                        "채팅 목록을 불러올 수 없습니다",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () {
                          ref.read(chatRoomProvider.notifier).refresh();
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
