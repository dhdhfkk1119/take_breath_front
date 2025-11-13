import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_breath/_core/utils/widgets_app_bar.dart';
import '../../../../../domain/sse_notification/service/notification_service.dart';
import 'widgets/settings_notification_section.dart';
import 'widgets/settings_account_section.dart';
import 'widgets/settings_display_section.dart';
import 'widgets/settings_data_section.dart';

class SettingsPage extends StatefulWidget {
  final bool notificationEnabled;
  final bool isAnonymous;
  final Function(bool) onNotificationChanged;
  final Function(bool) onAnonymousChanged;

  const SettingsPage({
    Key? key,
    required this.notificationEnabled,
    required this.isAnonymous,
    required this.onNotificationChanged,
    required this.onAnonymousChanged,
  }) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool _notificationEnabled;
  late bool _soundEnabled;
  late bool _vibrationEnabled;
  late bool _isAnonymous;

  final NotificationService _notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    _notificationEnabled = widget.notificationEnabled;
    _soundEnabled = _notificationService.soundEnabled;
    _vibrationEnabled = _notificationService.vibrationEnabled;
    _isAnonymous = widget.isAnonymous;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: DraggableScrollableSheet(
          initialChildSize: 0.9,
          minChildSize: 0.7,
          maxChildSize: 0.95,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 제목
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(CupertinoIcons.back),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          '설정',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // =====================
                    // 섹션 1: 알림 설정
                    // =====================
                    _buildNotificationSection(),
                    const SizedBox(height: 28),

                    // =====================
                    // 섹션 2: 개인정보 설정
                    // =====================
                    SettingsAccountSection(
                      isAnonymous: _isAnonymous,
                      onAnonymousChanged: (value) {
                        setState(() => _isAnonymous = value);
                        widget.onAnonymousChanged(value);
                      },
                    ),
                    const SizedBox(height: 28),

                    // =====================
                    // 섹션 3: 디스플레이 설정
                    // =====================
                    const SettingsDisplaySection(),
                    const SizedBox(height: 28),

                    // =====================
                    // 섹션 4: 데이터 및 보안
                    // =====================
                    const SettingsDataSection(),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // ============================================================
  // 알림 섹션 빌드
  // ============================================================
  Widget _buildNotificationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '알림',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 12),

        // 1️⃣ 알림 수신
        _buildToggleItem(
          title: '알림 수신',
          subtitle: '메시지와 업데이트 알림',
          value: _notificationEnabled,
          onChanged: (value) async {
            setState(() => _notificationEnabled = value);
            await _notificationService.setNotificationEnabled(value);
            widget.onNotificationChanged(value);
          },
        ),
        const SizedBox(height: 16),

        // 2️⃣ 소리 알림
        _buildToggleItem(
          title: '소리 알림',
          subtitle: '알림음 재생',
          value: _soundEnabled,
          enabled: _notificationEnabled,
          onChanged: _notificationEnabled
              ? (value) async {
                  setState(() => _soundEnabled = value);
                  await _notificationService.setSoundEnabled(value);
                }
              : null,
        ),
        const SizedBox(height: 16),

        // 3️⃣ 진동 알림
        _buildToggleItem(
          title: '진동 알림',
          subtitle: '알림 진동 활성화',
          value: _vibrationEnabled,
          enabled: _notificationEnabled,
          onChanged: _notificationEnabled
              ? (value) async {
                  setState(() => _vibrationEnabled = value);
                  await _notificationService.setVibrationEnabled(value);
                }
              : null,
        ),
      ],
    );
  }

  // ============================================================
  // 토글 아이템 빌드
  // ============================================================
  Widget _buildToggleItem({
    required String title,
    required String subtitle,
    required bool value,
    bool enabled = true,
    required Function(bool)? onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: enabled ? Colors.black87 : Colors.grey[400],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: enabled ? Colors.grey[600] : Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: enabled ? onChanged : null,
            activeColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
