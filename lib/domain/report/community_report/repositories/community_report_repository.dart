import 'package:take_breath/_core/utils/my_http.dart';
import 'package:take_breath/domain/report/community_report/models/community_report_detail.dart';
import 'package:take_breath/domain/report/community_report/models/community_report_list_response.dart';
import 'package:take_breath/domain/report/community_report/models/community_report_request.dart';
import 'package:take_breath/domain/report/community_report/models/community_report_response.dart';

class CommunityReportRepository {
  Future<CommunityReportResponse> reportCommunity(
      CommunityReportRequest request, int postId) async {
    try {
      final response = await dio.post(
        "/community/reports/posts/$postId",
        data: {
          "reason": request.reason,
        },
      );
      if (response.statusCode == 200) {
        print("커뮤니티 신고 : ${response.data['response']}");
        return CommunityReportResponse.fromJson(response.data['response']);
      } else {
        throw Exception("커뮤니티 신고 실패");
      }
    } catch (e) {
      throw Exception("커뮤니티 신고 서버에 연결 실패 ");
    }
  }

  Future<List<CommunityReportListResponse>> findMyReports(
      {int page = 0, int size = 10}) async {
    try {
      final response = await dio.get(
        "/community/reports",
      );
      if (response.statusCode == 200) {
        final List<dynamic> responseList = response.data['response'];
        final List<CommunityReportListResponse> result = responseList
            .map((e) => CommunityReportListResponse.fromJson(e))
            .toList();
        print("신고 리스트 내역 : ${result}");
        return result;
      } else {
        throw Exception("신고 리스트 내역 실패 (상태코드: ${response.statusCode})");
      }
    } catch (e) {
      throw Exception("신고 리스트 내역 연결 실패 ");
    }
  }

  Future<CommentReportDetailDTO> getReportDetail(int reportId) async {
    try {
      final response = await dio.get(
        "/community/reports/post/$reportId",
      );
      if (response.statusCode == 200) {
        print("신고 상세 내역 : ${response.data['response']}");
        return CommentReportDetailDTO.fromJson(response.data['response']);
      } else {
        throw Exception("신고 상세 내역");
      }
    } catch (e) {
      throw Exception("서버에 연결 실패 ");
    }
  }
}
