import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/chat/models/chat_room_list_state.dart';
import 'package:take_breath/domain/chat/providers/chat_room_repository_provider.dart';

class ChatRoomNotifier extends AsyncNotifier<ChatRoomListState> {
  static const int pageSize = 10;

  @override
  Future<ChatRoomListState> build() async {
    return _loadPage(0);
  }

  /// 특정 페이지 로드
  Future<ChatRoomListState> _loadPage(int page) async {
    final repo = ref.read(chatRoomRepositoryProvider);
    final sliceResponse = await repo.getChatRoomList(
      page: page,
      size: pageSize,
    );

    return ChatRoomListState(
      rooms: sliceResponse.content,
      currentPage: sliceResponse.pageNumber,
      hasNext: sliceResponse.hasNext,
    );
  }

  /// 다음 페이지 로드
  Future<void> loadMore() async {
    final currentState = state.value;
    if (currentState == null ||
        !currentState.hasNext ||
        currentState.isLoadingMore) {
      return;
    }

    // 로딩 상태로 변경
    state = AsyncData(currentState.copyWith(isLoadingMore: true));

    try {
      final repo = ref.read(chatRoomRepositoryProvider);
      final nextPage = currentState.currentPage + 1;

      final sliceResponse = await repo.getChatRoomList(
        page: nextPage,
        size: pageSize,
      );

      // 기존 데이터에 새 데이터 추가
      final updatedRooms = [
        ...currentState.rooms,
        ...sliceResponse.content,
      ];

      state = AsyncData(ChatRoomListState(
        rooms: updatedRooms,
        currentPage: sliceResponse.pageNumber,
        hasNext: sliceResponse.hasNext,
        isLoadingMore: false,
      ));
    } catch (e, stackTrace) {
      state = AsyncData(currentState.copyWith(isLoadingMore: false));
      rethrow;
    }
  }

  // 새로고침
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return _loadPage(0);
    });
  }
}
