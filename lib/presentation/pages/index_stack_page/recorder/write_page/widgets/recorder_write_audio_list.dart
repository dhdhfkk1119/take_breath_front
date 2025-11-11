import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class RecorderWriteAudioList extends StatelessWidget {
  final List<File> audios;
  final Function(int) onRemove;

  const RecorderWriteAudioList({
    Key? key,
    required this.audios,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (audios.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '음성 녹음',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        Column(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '음성 녹음 ${index + 1}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          audios[index].path.split('/').last,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),
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
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
