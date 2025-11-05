enum ConnectionState {
  connecting,    // 연결 시도 중
  connected,     // 연결됨
  disconnected,  // 연결 끊김
  reconnecting,  // 재연결 중
  failed,       // 연결 실패
  error         // 에러
}
