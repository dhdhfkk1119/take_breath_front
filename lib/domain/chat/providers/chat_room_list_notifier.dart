import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/chat/models/chat_room.dart';

import 'chat_repository_provider.dart';

// NotifierProvider 선언
final chatRoomListProvider =
    AsyncNotifierProvider<ChatRoomListNotifier, List<ChatRoom>>(
        () => ChatRoomListNotifier());

// 채팅방 목록을 관리하는 Notifier
class ChatRoomListNotifier extends AsyncNotifier<List<ChatRoom>> {
  @override
  Future<List<ChatRoom>> build() {
    final repo = ref.read(chatRepositoryProvider); // Repository 주입받음
    return repo.getChatRoomList(1); // API 호출 → 상태 자동 저장됨
  }

  // 새로고침 기능
  Future<void> refresh() async {
    state = const AsyncLoading(); // 로딩 상태
    state = await AsyncValue.guard(() async {
      final repo = ref.read(chatRepositoryProvider);
      return repo.getChatRoomList(1);
    });
  }
}
