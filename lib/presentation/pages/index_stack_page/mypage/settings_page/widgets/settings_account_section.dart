import 'package:flutter/material.dart';
import 'settings_toggle_item.dart';

class SettingsAccountSection extends StatefulWidget {
  final bool isAnonymous;
  final Function(bool) onAnonymousChanged;

  const SettingsAccountSection({
    Key? key,
    required this.isAnonymous,
    required this.onAnonymousChanged,
  }) : super(key: key);

  @override
  State<SettingsAccountSection> createState() => _SettingsAccountSectionState();
}

class _SettingsAccountSectionState extends State<SettingsAccountSection> {
  late bool _isAnonymous;

  @override
  void initState() {
    super.initState();
    _isAnonymous = widget.isAnonymous;
  }

  // 계정 공개 팝업
  void _showAccountShareDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('계정 정보 공개'),
          content: const Text(
            '당신의 정보를 보여주시겠습니까?\n\n공개 상태가 되면 다른 사용자가 당신의 프로필을 볼 수 있습니다.',
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          actions: [
            // 취소 버튼
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                '취소',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            // 확인 버튼
            TextButton(
              onPressed: () {
                setState(() {
                  _isAnonymous = false;
                });
                widget.onAnonymousChanged(false);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('공개 상태로 변경되었습니다.'),
                    duration: Duration(seconds: 2),
                  ),
                );
                // 🔗 백엔드 연동: POST /api/settings/account/share
                // _updateAccountShareSetting(false);
              },
              child: const Text(
                '확인',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        );
      },
    );
  }

  // 비공개로 다시 전환 팝업
  void _showAccountPrivateDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('계정 정보 비공개'),
          content: const Text(
            '계정을 비공개로 변경하시겠습니까?\n\n익명 상태가 되면 다른 사용자가 당신의 프로필을 볼 수 없습니다.',
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                '취소',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _isAnonymous = true;
                });
                widget.onAnonymousChanged(true);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('익명 상태로 변경되었습니다.'),
                    duration: Duration(seconds: 2),
                  ),
                );
                // 🔗 백엔드 연동: POST /api/settings/account/private
                // _updateAccountShareSetting(true);
              },
              child: const Text(
                '확인',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('개인정보'),
        const SizedBox(height: 12),
        SettingsToggleItem(
          title: '계정 공개',
          subtitle: _isAnonymous ? '익명 상태' : '공개 상태',
          value: !_isAnonymous,
          onChanged: (value) {
            if (value) {
              // 공개로 변경
              _showAccountShareDialog();
            } else {
              // 비공개로 변경
              _showAccountPrivateDialog();
            }
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
