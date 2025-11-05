import 'dart:async';
import 'dart:convert';

import 'package:stomp_dart_client/stomp_dart_client.dart';
import 'package:take_breath/_core/constants/api_config.dart';
import 'package:take_breath/_core/utils/models/api_response.dart';
import 'package:take_breath/domain/chat/models/chat_message_response.dart';
import 'package:take_breath/domain/chat/models/connection_state.dart';
import 'package:take_breath/domain/member/services/auth_storage.dart';

class StompChatService {
  StompClient? _stompClient;
  String? _currentRoomId;

  // 메세지 스트림
  final _messageController = StreamController<ChatMessageResponse>.broadcast();

  Stream<ChatMessageResponse> get messageStream => _messageController.stream;

  // 읽음 알림 Stream
  final _readStatusController = StreamController<String>.broadcast();

  Stream<String> get readStatusStream => _readStatusController.stream;

  // 연결 상태 Stream
  final _connectionController = StreamController<ConnectionState>.broadcast();

  Stream<ConnectionState> get connectionStream => _connectionController.stream;

  // 현재 연결 상태
  ConnectionState _connectionState = ConnectionState.disconnected;

  ConnectionState get connectionState => _connectionState;

  // STOMP 연결
  Future<void> connect({required String roomId}) async {
    if (_stompClient != null && _stompClient!.connected) {
      print("이미 연결되어 있습니다");
      return;
    }

    // AuthStorage에서 자동으로 JWT 토큰 가져오기
    final jwtToken = await AuthStorage.getAccessToken();
    if (jwtToken == null) {
      print("JWT 토큰이 없습니다. 로그인이 필요합니다.");
      _updateConnectionState(ConnectionState.error);
      throw Exception('인증 토큰이 없습니다');
    }

    _currentRoomId = roomId;
    _updateConnectionState(ConnectionState.connecting);

    // STOMP 클라이언트 설정
    _stompClient = StompClient(
      config: StompConfig.sockJS(
        url: ApiConfig.webSocketEndpoint,

        stompConnectHeaders: {'Authorization': 'Bearer $jwtToken'},
        webSocketConnectHeaders: {'Authorization': 'Bearer $jwtToken'},

        // 재연결 설정
        reconnectDelay: const Duration(seconds: 3),
        heartbeatIncoming: const Duration(seconds: 10),
        heartbeatOutgoing: const Duration(seconds: 10),

        // 연결 성공 롤백
        onConnect: (StompFrame frame) {
          print("STOMP 연결 성공");
          _updateConnectionState(ConnectionState.connected);
          _subscribeToChannels(roomId);
        },
        // 연결 전 설정
        beforeConnect: () async {
          print('STOMP 연결 중....');
          _updateConnectionState(ConnectionState.connecting);
        },
        // 웹소켓 에러
        onWebSocketError: (dynamic error) {
          print('웹소켓 에러: $error');
          _updateConnectionState(ConnectionState.error);
        },
        // STOMP 에러
        onStompError: (StompFrame frame) {
          print('STOMP 에러: ${frame.body}');
          _updateConnectionState(ConnectionState.error);
        },
        // 연결 해제
        onDisconnect: (StompFrame frame) {
          print('연결 해제됨');
          _updateConnectionState(ConnectionState.disconnected);
        },
      ),
    );

    // 연결 시작
    _stompClient!.activate();
  }

  // 채널 구독
  void _subscribeToChannels(String roomId) {
    if (_stompClient == null || !_stompClient!.connected) {
      print('STOMP 연결되지 않음');
      return;
    }

    // 1. 메세지 구독
    _stompClient!.subscribe(
      destination: '/topic/room.$roomId',
      callback: (StompFrame frame) {
        if (frame.body == null) return;

        try {
          // API 응답 파싱
          final jsonData = jsonDecode(frame.body!);
          final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
            jsonData,
            (json) => json as Map<String, dynamic>,
          );

          if (apiResponse.success && apiResponse.response != null) {
            final message = ChatMessageResponse.fromJson(apiResponse.response!);
            _messageController.add(message);
            print('새 메세지 수신: ${message.content}');
          } else if (apiResponse.error != null) {
            print('에러: ${apiResponse.error!.message}');
          }
        } catch (e) {
          print('메세지 파싱 에러: $e');
        }
      },
    );

    // 2. 읽음 알림 구독
    /*
    _stompClient!.subscribe(
      destination: '/topic/room.$roomId.read',
      callback: (StompFrame frame) {
        if (frame.body == null) return;

        try {
          final jsonData = jsonDecode(frame.body!);
          final apiResponse = ApiResponse<String>.fromJson(
            jsonData,
                (json) => json as String,
          );

          if (apiResponse.success && apiResponse.response != null) {
            _readStatusController.add(apiResponse.response!);
            print('읽음 알림: ${apiResponse.response}');
          }
        } catch (e) {
          print('읽음 알림 파싱 에러: $e');
        }
      },
    );
    */

    print('채널 구독 완료: room.$roomId');
  }

  // 메세지 보내기
  void sendMessage({
    required String roomId,
    required int chatRoomId,
    required int senderId,
    required String content,
    String messageType = 'TEXT',
  }) {
    if (_stompClient == null || !_stompClient!.connected) {
      print('STOMP 연결되지 않음');
      return;
    }

    final messageData = {
      'chatRoomId': chatRoomId,
      'senderId': senderId,
      'content': content,
      'messageType': messageType,
    };

    _stompClient!.send(
      destination: '/app/chat.sendMessage.$roomId',
      body: jsonEncode(messageData),
    );

    print('메세지 전송: $content');
  }

  // 읽음 처리
  void markAsRead({
    required String roomId,
    required int chatRoomId,
    required int memberId,
    required int lastMessageId,
  }) {
    if (_stompClient == null || !_stompClient!.connected) {
      print('STOMP 연결되지 않음');
      return;
    }

    final readData = {
      'chatRoomId': chatRoomId,
      'memberId': memberId,
      'lastMessageId': lastMessageId,
    };

    _stompClient!.send(
      destination: '/app/chat.markAsRead.$roomId',
      body: jsonEncode(readData),
    );

    print('읽음 처리: message $lastMessageId');
  }

  // 연결 해제
  void disconnect() {
    _stompClient?.deactivate();
    _stompClient = null;
    _currentRoomId = null;
    _updateConnectionState(ConnectionState.disconnected);
  }

  // 연결 상태 업데이트
  void _updateConnectionState(ConnectionState state) {
    _connectionState = state;
    _connectionController.add(state);
  }

  // 정리
  void dispose() {
    disconnect();
    _messageController.close();
    _readStatusController.close();
    _connectionController.close();
  }
}
