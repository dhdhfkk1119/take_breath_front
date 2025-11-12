import 'package:take_breath/_core/utils/my_http.dart';
import 'package:take_breath/_core/utils/page_request.dart';
import 'package:take_breath/domain/sse_notification/models/notification_model.dart';

class NotificationRepository {
  Future<PageResponse<NotificationModel>> getNotificationList(
      {int page = 0, int size = 10}) async {
    try {
      final response = await dio.get('/notifications/list', queryParameters: {
        'page': page,
        'size': size,
      });
      if (response.statusCode == 200) {
        final responseData = response.data['response'];
        return PageResponse<NotificationModel>.fromJson(
          responseData,
          (json) => NotificationModel.fromJson(json),
        );
      } else {
        throw Exception('Failed to load notifications : ${response.data}');
      }
    } catch (e) {
      throw Exception('Failed to load notifications : $e');
    }
  }

  Future<void> markNotificationAsRead(int id) async {
    try {
      final response = await dio.post(
        '/notifications/read/$id',
      );
      if (response.statusCode == 200) {
        print("알람 읽음 처리 완료");
      } else {
        throw new Exception("알람 읽음 처리중 오류 발생 :");
      }
    } catch (e) {
      throw new Exception("알람 읽음 처리중 오류 발생 : ${e.toString()}");
    }
  }
}
