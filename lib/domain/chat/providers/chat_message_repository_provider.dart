
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/chat/repositories/chat_message_repository.dart';

final chatMessageRepositoryProvider = Provider((ref) {
  return ChatMessageRepository();
});