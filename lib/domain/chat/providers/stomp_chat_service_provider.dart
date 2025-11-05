import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/chat/service/stomp_chat_service.dart';

final stompChatServiceProvider = Provider.family<StompChatService, String>(
  (ref, roomId) {
    final service = StompChatService();

    // Dispose 시 정리
    ref.onDispose(() {
      service.dispose();
    });

    return service;
  },
);
