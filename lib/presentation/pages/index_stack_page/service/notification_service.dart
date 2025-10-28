import 'package:vibration/vibration.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() {
    return _instance;
  }

  NotificationService._internal();

  late AudioPlayer _audioPlayer;
  bool _isInitialized = false;

  // 알림 설정 상태
  bool _notificationEnabled = true;
  bool _soundEnabled = true;
  bool _vibrationEnabled = true;

  bool get notificationEnabled => _notificationEnabled;
  bool get soundEnabled => _soundEnabled;
  bool get vibrationEnabled => _vibrationEnabled;

  // 초기화
  Future<void> initialize() async {
    if (_isInitialized) return;

    _audioPlayer = AudioPlayer();
    _isInitialized = true;

    // 저장된 설정 로드
    await _loadSettings();

    print('✅ NotificationService 초기화 완료');
  }

  // ============================================================
  // 1️⃣ 알림 수신 활성화/비활성화
  // ============================================================
  Future<void> setNotificationEnabled(bool enabled) async {
    _notificationEnabled = enabled;
    await _saveSettings();

    if (enabled) {
      print('✅ 알림 수신 활성화');
    } else {
      print('❌ 알림 수신 비활성화');
    }
  }

  // ============================================================
  // 2️⃣ 소리 알림 활성화/비활성화
  // ============================================================
  Future<void> setSoundEnabled(bool enabled) async {
    _soundEnabled = enabled;
    await _saveSettings();

    if (enabled) {
      print('✅ 소리 알림 활성화');
    } else {
      print('❌ 소리 알림 비활성화');
    }
  }

  // ============================================================
  // 3️⃣ 진동 알림 활성화/비활성화
  // ============================================================
  Future<void> setVibrationEnabled(bool enabled) async {
    _vibrationEnabled = enabled;
    await _saveSettings();

    if (enabled) {
      print('✅ 진동 알림 활성화');
      // 테스트 진동
      await _triggerVibration();
    } else {
      print('❌ 진동 알림 비활성화');
    }
  }

  // ============================================================
  // 알림 표시
  // ============================================================
  Future<void> showNotification({
    required String title,
    required String body,
  }) async {
    // 알림 수신이 비활성화되면 실행 안 함
    if (!_notificationEnabled) {
      print('⚠️ 알림이 비활성화되어 있습니다');
      return;
    }

    try {
      // 소리 재생
      if (_soundEnabled) {
        await _playNotificationSound();
      }

      // 진동
      if (_vibrationEnabled) {
        await _triggerVibration();
      }

      print('✅ 알림 표시: $title');
    } catch (e) {
      print('❌ 알림 표시 실패: $e');
    }
  }

  // ============================================================
  // 소리 재생
  // ============================================================
  Future<void> _playNotificationSound() async {
    try {
      // 기본 시스템 알림음 재생
      // 실제로는 assets에 있는 소리 파일을 사용할 수 있습니다
      await _audioPlayer.play(
        AssetSource('sounds/notification.mp3'),
      );
      print('🔊 알림음 재생');
    } catch (e) {
      print('❌ 알림음 재생 실패: $e');
    }
  }

  // ============================================================
  // 진동 트리거
  // ============================================================
  Future<void> _triggerVibration() async {
    try {
      // 진동 패턴: [0ms 대기, 250ms 진동, 250ms 대기, 250ms 진동]
      await Vibration.vibrate(
        pattern: [0, 250, 250, 250],
      );
      print('📳 진동 발생');
    } catch (e) {
      print('❌ 진동 실패: $e');
    }
  }

  // ============================================================
  // 저장/로드 (SharedPreferences)
  // ============================================================
  Future<void> _saveSettings() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('notification_enabled', _notificationEnabled);
      await prefs.setBool('sound_enabled', _soundEnabled);
      await prefs.setBool('vibration_enabled', _vibrationEnabled);
      print('💾 설정 저장됨');
    } catch (e) {
      print('❌ 설정 저장 실패: $e');
    }
  }

  Future<void> _loadSettings() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _notificationEnabled = prefs.getBool('notification_enabled') ?? true;
      _soundEnabled = prefs.getBool('sound_enabled') ?? true;
      _vibrationEnabled = prefs.getBool('vibration_enabled') ?? true;
      print('📖 설정 로드됨');
    } catch (e) {
      print('❌ 설정 로드 실패: $e');
    }
  }

  // 리소스 해제
  Future<void> dispose() async {
    await _audioPlayer.dispose();
  }
}
