import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RecorderWriteAttachButtons extends StatelessWidget {
  final VoidCallback onImagePick;
  final VoidCallback onAudioRecord;

  const RecorderWriteAttachButtons({
    Key? key,
    required this.onImagePick,
    required this.onAudioRecord,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          _buildButton(
            icon: CupertinoIcons.mic_fill,
            label: '음성녹음',
            onTap: onAudioRecord,
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
