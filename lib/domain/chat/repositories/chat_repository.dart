import 'package:take_breath/_core/utils/my_http.dart';
import 'package:take_breath/domain/chat/models/chat_room.dart';

class ChatRepository {
  // 채팅방 목록 조회
  Future<List<ChatRoom>> getChatRoomList(int memberId) async {
    try {
      final response = await dio.get(
        "chat/rooms",
        queryParameters: {"memberId": memberId},
      );

      if (response.statusCode == 200) {
        final data = response.data;

        if (data['success'] == true) {
          final List<dynamic> roomsJson = data['response'];
          return roomsJson.map((json) => ChatRoom.fromJson(json)).toList();
        } else {
          throw Exception("채팅방 목록 조회 실패: ${data['error']}");
        }
      } else {
        throw Exception("채팅방 목록 조회 실패: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("서버가 연결되어 있지 않습니다: $e");
    }
  }
}