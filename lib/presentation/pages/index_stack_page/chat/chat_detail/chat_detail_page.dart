import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';
import 'package:take_breath/domain/chat/models/chat_message_response/chat_message_response.dart';
import 'package:take_breath/domain/chat/models/chat_message_ui/chat_message_ui.dart';
import 'package:take_breath/presentation/pages/index_stack_page/chat/chat_detail/widgets/chat_detail_body.dart';
import 'package:take_breath/presentation/pages/index_stack_page/chat/chat_detail/widgets/chat_input_field.dart';

import '../../../../../domain/chat/providers/chat_message_repository_provider.dart';
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
  StompClient? stompClient; // stomp 클라
  final List<ChatMessageUI> messages = []; // 전체 메세지(이전 메세지, 현재 메세지)
  bool _isConnected = false; // 연결 유무
  bool _isUploadingImage = false;
  int? _currentUserId;

  @override
  void initState() {
    super.initState();
    _initChat();
  }

  Future<void> _initChat() async {
    final userInfo = await AuthStorage.getUserInfo();
    _currentUserId = userInfo?.id;

    if (_currentUserId == null) {
      debugPrint('❌ 사용자 정보 없음 - 로그인 필요');
      return;
    }

    debugPrint('✅ 현재 사용자 ID: $_currentUserId');

    await _loadChatHistory();
    await _connectStomp();
  }

  // 채팅 이력 가져오기
  Future<void> _loadChatHistory() async {
    try {
      final repository = ref.read(chatMessageRepositoryProvider);
      final loadMessages = await repository.getChatMessages(widget.roomId);

      setState(() {
        // ✅ 2. ChatMessageResponse → ChatMessageUI 변환
        final uiMessages = <ChatMessageUI>[];
        for (int i = 0; i < loadMessages.length; i++) {
          final msg = loadMessages[i];
          final prevMsg = i > 0 ? uiMessages[i - 1] : null;

          uiMessages.add(_convertToUIModel(msg, prevMsg));
        }

        // reversed로 최신 메시지가 위로
        messages.addAll(uiMessages.reversed);
      });

      debugPrint('✅ 과거 메시지 ${messages.length}개 로드 완료');
    } catch (e) {
      debugPrint("❌ 이전 메시지 로드 실패: $e");
    }
  }

  // 웹소켓 연결 설정
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
          if (mounted) {
            setState(() => _isConnected = false);
          }
        },
      ),
    );
    stompClient!.activate(); // 연결 시작
  }

  // 연결 성공 시 구독
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
          final decoded = jsonDecode(frame.body!); // 받은 응답 String -> Map 변환
          final data = decoded['response'] ?? decoded; // ApiResult 구조 파싱
          final msg = ChatMessageResponse.fromJson(data); // json 변환
          if (mounted) {
            setState(() {
              final prevMsg = messages.isNotEmpty ? messages.first : null;
              messages.insert(0, _convertToUIModel(msg, prevMsg));
            });
          }
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

  Future<void> _sendImageMessage(String imagePath) async {
    if (_isUploadingImage) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('이미지 업로드 중입니다...')),
      );
      return;
    }

    setState(() => _isUploadingImage = true);

    try {
      // 로딩 표시
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Row(
            children: [
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 12),
              Text('이미지 업로드 중...'),
            ],
          ),
          duration: Duration(hours: 1),
        ),
      );

      await ref.read(chatMessageRepositoryProvider).sendImageMessage(
            roomId: widget.roomId,
            imagePath: imagePath,
          );

      // 성공
      if (mounted) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('이미지를 전송했습니다.'),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      // 실패
      debugPrint('❌ 이미지 전송 실패: $e');

      if (mounted) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('이미지 전송 실패: ${e.toString()}'),
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.red,
            action: SnackBarAction(
              label: '재시도',
              textColor: Colors.white,
              onPressed: () => _sendImageMessage(imagePath),
            ),
          ),
        );
      }
    } finally {
      setState(() => _isUploadingImage = false);
    }
  }

  // ChatMessageResponse를 ChatMessageUI로 변환하는 핵심 메서드
  ChatMessageUI _convertToUIModel(
    ChatMessageResponse response,
    ChatMessageUI? previousMessage,
  ) {
    // isMe 계산
    final isMe = response.senderId == _currentUserId;

    // 이전 메시지와 비교
    final isSameSender = previousMessage?.senderId == response.senderId;
    final minutesDiff = previousMessage != null
        ? response.createdAt
            .difference(previousMessage.createdAt)
            .inMinutes
            .abs()
        : 999;

    // ✅ 같은 발신자 + 5분 이내면 프로필/시간 숨김
    final shouldShowProfile = !isSameSender || minutesDiff >= 5;
    final shouldShowTimestamp = !isSameSender || minutesDiff >= 5;

    return ChatMessageUI(
      message: response,
      isMe: isMe,
      showProfile: shouldShowProfile,
      showTimestamp: shouldShowTimestamp,
    );
  }

  @override
  void dispose() {
    stompClient?.deactivate();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        appBar: AppBar(title: Text(widget.roomName)),
        body: Column(
          children: [
            Expanded(
              child: ChatDetailBody(messages: messages),
            ),
            ChatInputField(
              onSend: _sendMessage,
              onImageSend: _sendImageMessage,
              enabled: _isConnected,
            ),
          ],
        ),
      ),
    );
  }
}
