import 'package:take_breath/_core/utils/my_http.dart';
import 'package:take_breath/domain/report/comment_report/models/comment_report_response.dart';

class CommentReportRepository {
  Future<void> reportComment(int commentId, String reason) async {
    try {
      final response = await dio.post(
        "/community/comment-reports/comments/$commentId",
        data: {
          "reason": reason,
        },
      );
      if (response.statusCode == 200) {
        print("댓글 신고 : ${response.data['response']}");
      } else {
        throw Exception("댓글 신고 실패 : ${response.data['error']}");
      }
    } catch (e) {
      throw Exception("댓글 신고 실패 : ${e.toString()}");
    }
  }

  Future<List<CommentReportListDTO>> findMyReports({
    int size = 10,
    int page = 0,
  }) async {
    try {
      final response = await dio.get(
        "/community/comment-reports/comments/",
        queryParameters: {
          "page": page,
          "size": size,
        },
      );

      if (response.statusCode == 200) {
        print("댓글 신고 : ${response.data['response']}");

        final List<dynamic> responseList = response.data['response'];
        final List<CommentReportListDTO> result =
            responseList.map((e) => CommentReportListDTO.fromJson(e)).toList();
        return result;
      } else {
        throw Exception("댓글 신고 실패 : ${response.data['error']}");
      }
    } catch (e) {
      throw Exception("댓글 신고 실패 : ${e.toString()}");
    }
  }

  Future<CommentReportDetailDTO> getReportDetail(int reportId) async {
    try {
      final response = await dio.get(
        "/community/comment-reports/comments/$reportId",
      );
      if (response.statusCode == 200) {
        print("댓글 신고 : ${response.data['response']}");
        return CommentReportDetailDTO.fromJson(response.data['response']);
      } else {
        throw Exception("댓글 신고 실패 : ${response.data['error']}");
      }
    } catch (e) {
      throw Exception("댓글 신고 실패 : ${e.toString()}");
    }
  }
}
