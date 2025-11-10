import 'package:flutter_client_sse/flutter_client_sse.dart';
import 'package:flutter_client_sse/constants/sse_request_type_enum.dart';
import 'package:take_breath/_core/utils/my_http.dart';
import 'package:take_breath/domain/member/services/auth_storage.dart';
import 'notification_service.dart';

Future<void> connectSSE() async {
  final token = await AuthStorage.getAccessToken();

  SSEClient.subscribeToSSE(
    url: "${baseUrl}/notifications/subscribe/",
    method: SSERequestType.GET,
    header: {'Authorization': 'Bearer $token'},
  ).listen((event) async {
    final message = event.data ?? '';
    await NotificationService().onMessageReceived(message);
  });
}
