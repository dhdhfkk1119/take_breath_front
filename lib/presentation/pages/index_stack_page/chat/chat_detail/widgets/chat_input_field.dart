import 'package:flutter/material.dart';


class ChatInputField extends StatefulWidget {
  final Function(String) onSend;
  final bool enabled;

  const ChatInputField({
    super.key,
    required this.onSend,
    this.enabled = true,
  });

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final TextEditingController _controller = TextEditingController();

  void _submit() {
    if (!widget.enabled) return; // ✅ 연결 안되면 전송 불가
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    widget.onSend(text);
    _controller.clear();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // 📌 배경을 흰색으로
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100], // 📌 입력 필드 배경 연한 회색
                    borderRadius: BorderRadius.circular(24), // 📌 둥근 모서리
                    border: Border.all(
                      color: Colors.grey[300]!, // 📌 테두리 추가
                      width: 1,
                    ),
                  ),
                  child: TextField(
                    controller: _controller,
                    enabled: widget.enabled,
                    style: const TextStyle(
                      color: Colors.black87, // 📌 텍스트 색상
                      fontSize: 15,
                    ),
                    decoration: InputDecoration(
                      hintText: widget.enabled
                          ? "메시지를 입력하세요..."
                          : "서버에 연결 중입니다...",
                      hintStyle: TextStyle(
                        color: Colors.grey[500], // 📌 힌트 텍스트 색상
                        fontSize: 15,
                      ),
                      border: InputBorder.none, // 📌 기본 테두리 제거
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                    onSubmitted: (_) => _submit(),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                decoration: BoxDecoration(
                  color: widget.enabled
                      ? Colors.blue // 📌 활성화: 파란색
                      : Colors.grey[300], // 📌 비활성화: 회색
                  shape: BoxShape.circle, // 📌 원형 버튼
                ),
                child: IconButton(
                  icon: const Icon(Icons.send),
                  color: Colors.white, // 📌 아이콘 색상 흰색
                  onPressed: widget.enabled ? _submit : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}