import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/chat/models/chat_message_response.dart';

final realtimeMessageStreamProvider =
    StreamProvider.family<ChatMessageResponse, String>(
  (ref, roomId) {},
);
