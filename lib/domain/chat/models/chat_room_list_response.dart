import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room_list_response.freezed.dart';
part 'chat_room_list_response.g.dart';

@freezed
class ChatRoomListResponse with _$ChatRoomListResponse {
  const factory ChatRoomListResponse({
    required int roomId,
    required String roomName,
    required int unreadCount,
    required String? lastMessage,
    required String? lastMessageTime,
    required int otherMemberId,
    required String otherMemberName,
  }) = _ChatRoomListResponse;

  factory ChatRoomListResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomListResponseFromJson(json);
}