import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/chat/repositories/chat_repository.dart';

final chatRepositoryProvider = Provider((ref) {
  return ChatRepository();
});