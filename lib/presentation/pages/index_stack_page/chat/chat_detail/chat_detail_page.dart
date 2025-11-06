import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';
import 'package:take_breath/domain/chat/models/chat_message_response.dart';
import 'package:take_breath/presentation/pages/index_stack_page/chat/chat_detail/widgets/chat_detail_body.dart';
import 'package:take_breath/presentation/pages/index_stack_page/chat/chat_detail/widgets/chat_input_field.dart';

import '../../../../../domain/member/services/auth_storage.dart';

class ChatDetailPage extends ConsumerStatefulWidget {
  final int roomId;
  final String roomName;

  const ChatDetailPage({
    super.key,
    required this.roomId,
    required this.roomName,
  });

  @override
  ConsumerState<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends ConsumerState<ChatDetailPage> {
  StompClient? stompClient;
  final List<ChatMessageResponse> messages = [];
  bool _isConnected = false;
  int? myId;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    final member = await AuthStorage.getUserInfo();
    myId = member?.id;
    _connectWebSocket();
  }

  Future<void> _connectWebSocket() async {
    final token = await AuthStorage.getAccessToken();
    if (token == null) {
      print("⚠️ JWT 토큰이 없습니다. 로그인 필요");
      return;
    }

    stompClient = StompClient(
      config: StompConfig(
        // ✅ /websocket 없이 순수 /ws-chat만 사용
        url: 'ws://10.0.2.2:8080/ws',
        stompConnectHeaders: {'Authorization': 'Bearer $token'},
        webSocketConnectHeaders: {'Authorization': 'Bearer $token'},

        reconnectDelay: const Duration(seconds: 3),     // 연결 실패 시 자동 재시도 (optional)
        onConnect: _onConnect,
        onDisconnect: (frame) {
          print("🔌 WebSocket disconnected");
          setState(() => _isConnected = false);
        },
        onWebSocketError: (err) {
          print("⚠️ WebSocket error: $err");
          setState(() => _isConnected = false);
        },
        onStompError: (frame) {
          print("🚨 STOMP Error: ${frame.body}");
          setState(() => _isConnected = false);
        },
      ),
    );

    stompClient!.activate();
  }

  void _onConnect(StompFrame frame) {
    print("✅ Connected to WebSocket room ${widget.roomId}");
    setState(() => _isConnected = true);

    // 구독 (서버에서 broadcast하는 topic)
    stompClient!.subscribe(
      destination: '/sub/chat/room.${widget.roomId}',
      headers: {
        'Authorization': 'Bearer ${AuthStorage.getAccessToken()}',
      },
      callback: (frame) {
        if (frame.body != null) {
          final data = jsonDecode(frame.body!);
          final msg = ChatMessageResponse.fromJson(data);

          final isMine = msg.senderId == myId;
          final updated = msg.copyWith(isMe: isMine);

          setState(() => messages.insert(0, updated));
        }
      },
    );
  }

  void _sendMessage(String content) async {
    if (stompClient == null || !stompClient!.connected) {
      print("⚠️ WebSocket is not connected. Cannot send message.");
      return;
    }

    final token = await AuthStorage.getAccessToken();
    final msgBody = {
      "content": content,
      "messageType": "TEXT",
    };

    stompClient!.send(
      destination: '/pub/chat.sendMessage.${widget.roomId}',
      body: jsonEncode(msgBody),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
  }

  @override
  void dispose() {
    stompClient?.deactivate();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.roomName)),
      body: Column(
        children: [
          Expanded(child: ChatDetailBody(messages: messages)),
          ChatInputField(
            onSend: _sendMessage,
            enabled: _isConnected, // ✅ 연결이 완료돼야만 입력 가능
          ),
        ],
      ),
    );
  }
}