import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChatInputField extends StatefulWidget {
  final Function(String) onSend;
  final Function(String)? onImageSend;
  final bool enabled;

  const ChatInputField({
    super.key,
    required this.onSend,
    this.onImageSend,
    this.enabled = true,
  });

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final TextEditingController _controller = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final hasText = _controller.text.trim().isNotEmpty;
      if (_hasText != hasText) {
        setState(() {
          _hasText = hasText;
        });
      }
    });
  }

  // 텍스트 이미지 전송하기
  void _submit() {
    if (!widget.enabled) return; // 연결 안되면 전송 불가

    final text = _controller.text.trim();
    if (text.isEmpty) return; // 텍스트 없으면 전송 불가

    widget.onSend(text); // 메세지 전송
    _controller.clear();
  }

  // 이미지 선택하기
  Future<void> _onAddPressed() async {
    if (widget.onImageSend == null) return;

    // 하단에 선택 옵션 표시
    final result = await showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('갤러리에서 선택'),
            onTap: () => Navigator.pop(context, 'gallery'),
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('카메라로 촬영'),
            onTap: () => Navigator.pop(context, 'camera'),
          ),
        ],
      )),
    );

    if (result == null) return;

    // 이미지 선택
    final XFile? image = await _picker.pickImage(
      source: result == 'camera' ? ImageSource.camera : ImageSource.gallery,
      maxWidth: 1920,
      maxHeight: 1920,
      imageQuality: 85,
    );

    if (image != null) {
      widget.onImageSend!(image.path);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // 이미지 선택 버튼
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey[300]!,
                    width: 1,
                  ),
                ),
                child: IconButton(
                  icon: const Icon(Icons.add, size: 24),
                  color: Colors.grey[700],
                  padding: EdgeInsets.zero,
                  onPressed: widget.enabled ? _onAddPressed : null,
                ),
              ),
              const SizedBox(width: 8),
              // 메세지 입력 필드
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Colors.grey[300]!,
                      width: 1,
                    ),
                  ),
                  child: TextField(
                    controller: _controller,
                    enabled: widget.enabled,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 15,
                    ),
                    decoration: InputDecoration(
                      hintText:
                          widget.enabled ? "메시지를 입력하세요..." : "서버에 연결 중입니다...",
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 15,
                      ),
                      border: InputBorder.none,
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
              // 텍스트 메세지 전송 버튼
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: widget.enabled && _hasText
                      ? const Color(0xFF4A90E2)
                      : Colors.grey[100],
                  shape: BoxShape.circle,
                  border: widget.enabled && _hasText
                      ? null
                      : Border.all(
                          color: Colors.grey[300]!,
                          width: 1,
                        ),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.send,
                    size: 24,
                  ),
                  color: widget.enabled && _hasText
                      ? Colors.white
                      : Colors.grey[700],
                  padding: EdgeInsets.zero,
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
