import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_chat_room_response.freezed.dart';
part 'create_chat_room_response.g.dart';

@freezed
class CreateChatRoomResponse with _$CreateChatRoomResponse {
  const factory CreateChatRoomResponse({
    required int roomId,
    required String roomName,
  }) = _CreateChatRoomResponse;

  factory CreateChatRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateChatRoomResponseFromJson(json);
}
