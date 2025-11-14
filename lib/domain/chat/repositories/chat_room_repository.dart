import 'package:take_breath/_core/utils/my_http.dart';
import 'package:take_breath/domain/chat/models/chat_room_slice_response/chat_room_slice_response.dart';
import 'package:take_breath/domain/chat/models/create_chat_room_response/create_chat_room_response.dart';

class ChatRoomRepository {
  // 채팅방 목록 조회 (Slice 페이징)
  Future<ChatRoomSliceResponse> getChatRoomList({
    required int page,
    required int size,
  }) async {
    try {
      final response = await dio.get(
        "/chat/rooms",
        queryParameters: {
          'page': page,
          'size': size,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data['success'] == true) {
          return ChatRoomSliceResponse.fromJson(data['response']);
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

  // 1:1 상담 채팅방 생성
  Future<CreateChatRoomResponse> createConsultationRoom({
    required int consultantId,
  }) async {
    try {
      final response = await dio.post(
        "/chat/rooms/consultation",
        data: {
          'consultantId': consultantId,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data['success'] == true) {
          return CreateChatRoomResponse.fromJson(data['response']);
        } else {
          throw Exception("상담방 생성 실패: ${data['error']}");
        }
      } else {
        throw Exception("상담방 생성 실패: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("서버가 연결되어 있지 않습니다: $e");
    }
  }
}