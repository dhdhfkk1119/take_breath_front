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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                enabled: widget.enabled,
                decoration: InputDecoration(
                  hintText: widget.enabled
                      ? "메시지를 입력하세요..."
                      : "서버에 연결 중입니다...",
                  border: const OutlineInputBorder(),
                ),
                onSubmitted: (_) => _submit(),
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: widget.enabled ? _submit : null,
            ),
          ],
        ),
      ),
    );
  }
}