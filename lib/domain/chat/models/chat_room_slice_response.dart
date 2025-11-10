


import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:take_breath/domain/chat/models/chat_room_list_response.dart';

part 'chat_room_slice_response.freezed.dart';
part 'chat_room_slice_response.g.dart';

@freezed
class ChatRoomSliceResponse with _$ChatRoomSliceResponse {
  const factory ChatRoomSliceResponse({
    required List<ChatRoomListResponse> content,
    required int pageNumber,
    required int pageSize,
    required bool hasNext,
    required bool isFirst,
    required bool isLast,
  }) = _ChatRoomSliceResponse;

  factory ChatRoomSliceResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomSliceResponseFromJson(json);
}