import 'package:dio/dio.dart';
import 'package:take_breath/_core/utils/my_http.dart';
import 'package:take_breath/domain/chat/models/chat_message_response/chat_message_response.dart';

class ChatMessageRepository {
  /// 채팅방의 메시지 목록 조회 - GET /api/chat/messages/1
  Future<List<ChatMessageResponse>> getChatMessages(int roomId) async {
    try {
      final response = await dio.get(
        "/chat/messages/$roomId",
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

  /// 이미지 메시지 전송 - POST /api/chat/messages/{roomId}/image
  Future<ChatMessageResponse> sendImageMessage({
    required int roomId,
    required String imagePath,
  }) async {
    try {
      // FormData 생성
      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          imagePath,
          filename: imagePath.split('/').last,
        ),
      });

      final response = await dio.post(
        "/chat/messages/$roomId/image",
        data: formData,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;

        if (data['success'] == true) {
          return ChatMessageResponse.fromJson(data['response']);
        } else {
          throw Exception("이미지 전송 실패: ${data['error']}");
        }
      } else {
        throw Exception("이미지 전송 실패: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("이미지 전송 중 오류 발생: $e");
    }
  }
}

/*

} on DioException catch (e) {
  if (e.response?.statusCode == 400) {
    final errorMsg = e.response?.data['error']?['message'] ?? '잘못된 요청입니다';
    throw Exception(errorMsg);
  }
  throw Exception("네트워크 오류: ${e.message}");
} catch (e) {
  throw Exception("이미지 전송 중 오류 발생: $e");
}

 */
