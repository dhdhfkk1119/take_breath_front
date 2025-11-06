import 'package:take_breath/_core/utils/my_http.dart';
import 'package:take_breath/domain/chat/models/chat_message_response.dart';

class ChatMessageRepository {
  // 채팅방의 메시지 목록 조회 (읽음 여부 포함)
  // GET /api/chat/messages?roomId=1
  Future<List<ChatMessageResponse>> getChatMessages(int roomId) async {
    try {
      final response = await dio.get(
        "/chat/messages",
        queryParameters: {
          'roomId': roomId,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;

        if (data['success'] == true) {
          final List<dynamic> messagesJson = data['response'];
          return messagesJson
              .map((json) => ChatMessageResponse.fromJson(json))
              .toList();
        } else {
          throw Exception("채팅 메시지 조회 실패: ${data['error']}");
        }
      } else {
        throw Exception("채팅 메시지 조회 실패: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("서버가 연결되어 있지 않습니다: $e");
    }
  }
}
