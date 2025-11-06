import 'package:take_breath/_core/utils/my_http.dart';
import 'package:take_breath/domain/comment/models/community_comment_request.dart';
import 'package:take_breath/domain/comment/models/community_comment_response.dart';

class CommunityCommentRepository {
  Future<CommunityCommentResponse> saveComment(
      int postId, CommunityCommentRequest request) async {
    try {
      final response =
          await dio.post("/community/comments/posts/$postId", data: {
        "content": request.content,
      });
      if (response.statusCode == 200) {
        return CommunityCommentResponse.fromJson(response.data['response']);
      } else {
        throw Exception("댓글 저장 실패 : ${response.data['error'] ?? '알 수 없는 오류'}");
      }
    } catch (e) {
      throw Exception("댓글 저장 실패 : ${e.toString()}");
    }
  }

  Future<void> updateComment(
      int commentId, CommunityCommentRequest request) async {
    try {
      final response = await dio.put(
        "/community/comments/$commentId",
        data: {'content': request.content},
      );
      if (response.statusCode != 200) {
        throw Exception("댓글 수정 실패");
      }
    } catch (e) {
      throw Exception("댓글 수정 실패: ${e.toString()}");
    }
  }

  Future<CommunityCommentResponse> findCommentsByPostId(int postId) async {
    try {
      final response = await dio.get("/community/comments/posts/$postId");
      if (response.statusCode == 200) {
        return CommunityCommentResponse.fromJson(response.data['response']);
      } else {
        throw Exception("댓글 조회 실패 : ${response.data['error']}");
      }
    } catch (e) {
      throw Exception("댓글 조회 실패 : ${e.toString()}");
    }
  }

  Future<String> deleteComment(int commentId) async {
    try {
      final response = await dio.delete("/community/comments/$commentId");
      if (response.statusCode == 200) {
        return response.data['response'];
      } else {
        throw Exception("댓글 조회 실패 : ${response.data['error']}");
      }
    } catch (e) {
      throw Exception("댓글 조회 실패 : ${e.toString()}");
    }
  }
}
