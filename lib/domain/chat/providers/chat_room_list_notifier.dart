import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/chat/models/chat_room_list_response.dart';

import 'chat_room_repository_provider.dart';

// NotifierProvider 선언
final chatRoomListProvider =
    AsyncNotifierProvider<ChatRoomListNotifier, List<ChatRoomListResponse>>(
        () => ChatRoomListNotifier());

// 채팅방 목록을 관리하는 Notifier
class ChatRoomListNotifier extends AsyncNotifier<List<ChatRoomListResponse>> {
  @override
  Future<List<ChatRoomListResponse>> build() {
    final repo = ref.read(chatRoomRepositoryProvider); // Repository 주입받음
    return repo.getChatRoomList(1); // API 호출 → 상태 자동 저장됨
  }

  // 새로고침 기능
  Future<void> refresh() async {
    state = const AsyncLoading(); // 로딩 상태
    state = await AsyncValue.guard(() async {
      final repo = ref.read(chatRoomRepositoryProvider);
      return repo.getChatRoomList(1);
    });
  }
}
