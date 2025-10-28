import 'package:flutter/material.dart';
import 'settings_toggle_item.dart';

class SettingsNotificationSection extends StatefulWidget {
  final bool notificationEnabled;
  final Function(bool) onNotificationChanged;

  const SettingsNotificationSection({
    Key? key,
    required this.notificationEnabled,
    required this.onNotificationChanged,
  }) : super(key: key);

  @override
  State<SettingsNotificationSection> createState() =>
      _SettingsNotificationSectionState();
}

class _SettingsNotificationSectionState
    extends State<SettingsNotificationSection> {
  late bool _notificationEnabled;
  late bool _soundEnabled;
  late bool _vibrationEnabled;

  @override
  void initState() {
    super.initState();
    _notificationEnabled = widget.notificationEnabled;
    _soundEnabled = true;
    _vibrationEnabled = true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('알림'),
        const SizedBox(height: 12),
        SettingsToggleItem(
          title: '알림 수신',
          subtitle: '메시지와 업데이트 알림',
          value: _notificationEnabled,
          onChanged: (value) {
            setState(() => _notificationEnabled = value);
            widget.onNotificationChanged(value);
            // 🔗 백엔드 연동: POST /api/settings/notification
            // _updateNotificationSetting(value);
          },
        ),
        const SizedBox(height: 12),
        SettingsToggleItem(
          title: '소리 알림',
          subtitle: '알림 수신 시 소리 재생',
          value: _soundEnabled,
          onChanged: (value) {
            setState(() => _soundEnabled = value);
            // 🔗 백엔드 연동: POST /api/settings/notification/sound
            // _updateSoundSetting(value);
          },
        ),
        const SizedBox(height: 12),
        SettingsToggleItem(
          title: '진동 알림',
          subtitle: '알림 수신 시 진동',
          value: _vibrationEnabled,
          onChanged: (value) {
            setState(() => _vibrationEnabled = value);
            // 🔗 백엔드 연동: POST /api/settings/notification/vibration
            // _updateVibrationSetting(value);
          },
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
    );
  }
}
