import 'package:take_breath/domain/chat/models/chat_room_list_response/chat_room_list_response.dart';

class ChatRoomListState {
  final List<ChatRoomListResponse> rooms;
  final int currentPage;
  final bool hasNext;
  final bool isLoading;
  final bool isLoadingMore;

  ChatRoomListState({
    required this.rooms,
    required this.currentPage,
    required this.hasNext,
    this.isLoading = false,
    this.isLoadingMore = false,
  });

  ChatRoomListState copyWith({
    List<ChatRoomListResponse>? rooms,
    int? currentPage,
    bool? hasNext,
    bool? isLoading,
    bool? isLoadingMore,
  }) {
    return ChatRoomListState(
      rooms: rooms ?? this.rooms,
      currentPage: currentPage ?? this.currentPage,
      hasNext: hasNext ?? this.hasNext,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}
