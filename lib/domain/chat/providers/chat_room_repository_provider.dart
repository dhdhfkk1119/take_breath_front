import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/chat/repositories/chat_room_repository.dart';

final chatRoomRepositoryProvider = Provider((ref) {
  return ChatRoomRepository();
});