import 'package:take_breath/_core/utils/my_http.dart';
import 'package:take_breath/domain/toggle_like/models/like_response.dart';

class ToggleLikeRepository {
  Future<LikeResponse> toggleLike(int postId) async {
    try {
      final response = await dio.post(
        "/community/posts/${postId}/like",
      );
      if (response.statusCode == 200) {
        print("토글 확인 : ${response.data['response']}");
        return LikeResponse.fromJson(response.data['response']);
      } else {
        throw Exception('Failed to toggle like');
      }
    } catch (e) {
      throw Exception('서버 연결을 확인해 주세요 ${e}');
    }
  }
}
