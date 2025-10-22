import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RecorderDetailAudioList extends StatelessWidget {
  final int audioCount;

  const RecorderDetailAudioList({
    Key? key,
    required this.audioCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        audioCount,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '음성 녹음 ${index + 1}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '00:00 / 02:35',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(CupertinoIcons.play_circle_fill, size: 32),
                color: const Color(0xFF0891B2),
                onPressed: () {
                  // TODO: 음성 재생
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
