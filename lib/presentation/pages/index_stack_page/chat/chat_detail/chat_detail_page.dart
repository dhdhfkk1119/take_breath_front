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
  bool _isConnected = false;
  final List<ChatMessageResponse> messages = [];

  @override
  void initState() {
    super.initState();
    _connectStomp();
  }

  Future<void> _connectStomp() async {
    final token = await AuthStorage.getAccessToken();

    stompClient = StompClient(
      config: StompConfig(
        url: 'ws://10.0.2.2:8080/ws',
        beforeConnect: () async {
          debugPrint("WebSocket 연결 중...");
        },
        webSocketConnectHeaders: {
          'Authorization': 'Bearer $token',
        },
        stompConnectHeaders: {
          'Authorization': 'Bearer $token',
        },
        onConnect: _onConnect,
        onWebSocketDone: () {
          debugPrint('🛑 WebSocket 연결 닫힘');
        },
        onStompError: (frame) {
          debugPrint('❌ STOMP Error: ${frame.body}');
        },
        onWebSocketError: (error) {
          debugPrint('❌ WebSocket Error: $error');
        },
        onDisconnect: (frame) {
          debugPrint('🛑 WebSocket 연결 종료');
          setState(() => _isConnected = false);
        },
      ),
    );
    stompClient!.activate();  // 연결 시작
  }

  // 연결 성공 -> 구독
  void _onConnect(StompFrame frame) async {
    debugPrint('✅ STOMP 연결 완료 -> 채널 구독 진행');
    setState(() => _isConnected = true);
    final token = await AuthStorage.getAccessToken();

    // 해당 채팅방 구독
    final destination = '/sub/chat/room.${widget.roomId}';
    stompClient!.subscribe(
      destination: destination,
      headers: {'Authorization': 'Bearer $token'},
      callback: (frame) {
        if (frame.body != null) {

          final decoded = jsonDecode(frame.body!);      // 받은 응답 String -> Map 변환
          final data = decoded['response'] ?? decoded;  // ApiResult 구조 파싱
          final msg = ChatMessageResponse.fromJson(data); // json 변환ㅁㄴㅇ
          setState(() {
            messages.add(msg);
          });
        }
      },
    );
  }

  // 메세지 전송
  Future<void> _sendMessage(String content) async {
    debugPrint('✅ 채팅방 메세지 전송');
    if (!_isConnected) return;
    final token = await AuthStorage.getAccessToken();

    stompClient!.send(
      destination: '/pub/chat.sendMessage.${widget.roomId}',
      headers: {'Authorization': 'Bearer $token'},
      body: jsonEncode({
        "content": content,
        "messageType": "TEXT",
      }),
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
            enabled: _isConnected,
          ),
        ],
      ),
    );
  }
}
