import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message_response.freezed.dart';
part 'chat_message_response.g.dart';

@freezed
class ChatMessageResponse with _$ChatMessageResponse {
  const factory ChatMessageResponse({
    required int messageId,
    required int senderId,
    required String senderName,
    String? content,
    required String messageType,
    required DateTime createdAt,
    String? attachmentPath,
    int? currentPoint,
    required bool isRead,
  }) = _ChatMessageResponse;

  factory ChatMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageResponseFromJson(json);
}