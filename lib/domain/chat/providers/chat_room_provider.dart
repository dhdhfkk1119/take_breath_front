import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/chat/models/chat_room_list_state.dart';
import 'package:take_breath/domain/chat/providers/notifier/chat_room_notifier.dart';

final chatRoomProvider =
    AsyncNotifierProvider<ChatRoomNotifier, ChatRoomListState>(
        () => ChatRoomNotifier());
