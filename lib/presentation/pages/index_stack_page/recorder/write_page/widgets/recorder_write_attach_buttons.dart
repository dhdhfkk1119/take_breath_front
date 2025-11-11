import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class RecorderWriteAttachButtons extends StatefulWidget {
  final Function(List<File>) onImagesPicked;
  final VoidCallback onAudioPicked; // ✅ onAudioRecord -> onAudioPicked

  const RecorderWriteAttachButtons({
    Key? key,
    required this.onImagesPicked,
    required this.onAudioPicked,
  }) : super(key: key);

  @override
  State<RecorderWriteAttachButtons> createState() =>
      _RecorderWriteAttachButtonsState();
}

class _RecorderWriteAttachButtonsState
    extends State<RecorderWriteAttachButtons> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImages() async {
    try {
      final List<XFile> pickedFiles = await _picker.pickMultiImage();

      if (pickedFiles.isNotEmpty) {
        final List<File> imageFiles =
            pickedFiles.map((xfile) => File(xfile.path)).toList();
        widget.onImagesPicked(imageFiles);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('이미지 선택 실패: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildButton(
            icon: CupertinoIcons.photo_fill,
            label: '사진',
            onTap: _pickImages,
          ),
          const SizedBox(width: 12),
          _buildButton(
            icon: CupertinoIcons.music_note, // ✅ 아이콘 변경 (더 적절함)
            label: '음성파일', // ✅ 라벨 변경 (녹음 -> 파일 선택)
            onTap: widget.onAudioPicked,
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: Colors.grey[700]),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
