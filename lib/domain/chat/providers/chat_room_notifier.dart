import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/chat/models/chat_room_list_state.dart';
import 'package:take_breath/domain/chat/providers/chat_room_repository_provider.dart';

// NotifierProvider 선언
final chatRoomProvider =
    AsyncNotifierProvider<ChatRoomNotifier, ChatRoomListState>(
        () => ChatRoomNotifier());

// 채팅방 목록을 관리하는 Notifier
class ChatRoomNotifier extends AsyncNotifier<ChatRoomListState> {
  static const int pageSize = 10; // 한 페이지당 20개

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

  /// 다음 페이지 로드 (무한 스크롤)
  Future<void> loadMore() async {
    final currentState = state.value;
    if (currentState == null ||
        !currentState.hasNext ||
        currentState.isLoadingMore) {
      return; // 더 이상 로드할 페이지가 없거나 이미 로딩 중이면 중단
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
      // 에러 발생 시 로딩 상태만 해제
      state = AsyncData(currentState.copyWith(isLoadingMore: false));
      // 에러를 다시 던져서 UI에서 처리할 수 있게 함
      rethrow;
    }
  }

  /// 새로고침 (첫 페이지부터 다시 로드)
  Future<void> refresh() async {
    state = const AsyncLoading(); // 로딩 상태
    state = await AsyncValue.guard(() async {
      return _loadPage(0);
    });
  }
}
