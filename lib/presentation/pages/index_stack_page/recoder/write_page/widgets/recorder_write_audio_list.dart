import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RecorderWriteAudioList extends StatelessWidget {
  final List<String> audios;
  final Function(int) onRemove;

  const RecorderWriteAudioList({
    Key? key,
    required this.audios,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        audios.length,
        (index) => Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(
                CupertinoIcons.mic_fill,
                size: 20,
                color: Colors.grey[700],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  '음성 녹음 ${index + 1}',
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              IconButton(
                icon: const Icon(CupertinoIcons.play_circle, size: 24),
                onPressed: () {
                  // TODO: 음성 재생
                },
              ),
              IconButton(
                icon: const Icon(CupertinoIcons.trash, size: 20),
                color: Colors.red,
                onPressed: () => onRemove(index),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
