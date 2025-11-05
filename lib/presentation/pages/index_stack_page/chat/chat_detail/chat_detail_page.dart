import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:take_breath/_core/constants/custom_showDialog.dart';
import 'package:take_breath/_core/utils/widgets_app_bar.dart';
import 'package:take_breath/presentation/pages/index_stack_page/chat/chat_detail/widgets/chat_detail_body.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'widgets/chat_detail_bottom.dart';

class ChatDetailPage extends StatefulWidget {
  final int roomId;

  const ChatDetailPage({
    super.key,
    required this.roomId,
  });

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  late WebSocketChannel _channel;
  final List<Map<String, dynamic>> _messages = [];

  @override
  void initState() {
    super.initState();
    // _connectWebSocket();
  }

  /// ✅ 웹소켓 연결
  void _connectWebSocket() {
    final uri = Uri.parse('ws://localhost:8080/ws-chat/${widget.roomId}');
    print("🔌 WebSocket 연결 시도: $uri");

    _channel = WebSocketChannel.connect(uri);

    // ✅ 수신 스트림 리스닝
    _channel.stream.listen((data) {
      print("📩 수신 메시지: $data");
      final decoded = jsonDecode(data);
      setState(() {
        _messages.add({
          'message': decoded['message'] ?? '',
          'isMe': decoded['sender'] == 'me', // sender 구분
        });
      });
    }, onError: (error) {
      print("⚠️ WebSocket 에러: $error");
    }, onDone: () {
      print("❌ WebSocket 연결 종료됨");
    });
  }

  /// ✅ 메시지 전송
  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    final messageData = {
      'roomId': widget.roomId,
      'sender': 'me', // 실제 로그인 사용자 ID or Email
      'message': text.trim(),
    };

    print("📤 전송 메시지: $messageData");
    _channel.sink.add(jsonEncode(messageData));

    // 전송 즉시 로컬에 표시
    setState(() {
      _messages.add({'message': text.trim(), 'isMe': true});
    });
  }

  @override
  void dispose() {
    print("🔌 WebSocket 연결 종료");
    _channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetsAppBar(
        title: "채팅방 #${widget.roomId}",
        icon: const Icon(Icons.more_vert),
        menuItems: [
          BottomMenuItem(
            title: "상담 종료하기",
            icon: const Icon(
              Icons.door_back_door_outlined,
              color: Colors.redAccent,
            ),
            onTap: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ChatDetailBody(messages: _messages),
          ),
          ChatDetailBottom(onSend: _sendMessage),
        ],
      ),
    );
  }
}

/*
class ChatDetailPage extends StatelessWidget {
  final int roomId;

  const ChatDetailPage({
    super.key,
    required this.roomId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetsAppBar(
        title: "테스트 채팅방 (아직 연결 안됨)",
        icon: Icon(Icons.more_vert),
        menuItems: [
          BottomMenuItem(
              title: "상담 종료하기",
              icon: const Icon(
                Icons.door_back_door_outlined,
                color: Colors.redAccent,
              ),
              onTap: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ChatDetailBody(roomId: roomId),
          ),
          ChatDetailBottom(),
        ],
      ),
    );
  }
}
*/
