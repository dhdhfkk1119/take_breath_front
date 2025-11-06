class ApiConfig {
  static const String baseIp = "10.0.2.2"; // 에뮬레이터
  static const String port = "8080";

  // HTTP API Base URL
  static const String baseUrl = "http://$baseIp:$port/api";

  // WebSocket Base URL (API prefix 제외)
  static const String socketUrl = "ws://$baseIp:$port";

  // WebSocket Endpoint
  static String get webSocketEndpoint => "$socketUrl/ws-chat";
}