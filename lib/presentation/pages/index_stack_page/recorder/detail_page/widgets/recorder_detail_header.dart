import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../../domain/recorder/models/record_item.dart';

class RecorderDetailHeader extends StatelessWidget {
  final RecordItem record;

  const RecorderDetailHeader({
    Key? key,
    required this.record,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          record.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Icon(CupertinoIcons.calendar, size: 16, color: Colors.grey[600]),
            const SizedBox(width: 8),
            Text(
              record.date,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(width: 16),
            if (record.imageCount > 0) ...[
              Icon(CupertinoIcons.photo, size: 16, color: Colors.grey[600]),
              const SizedBox(width: 4),
              Text(
                '${record.imageCount}',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              const SizedBox(width: 12),
            ],
            if (record.audioCount > 0) ...[
              Icon(CupertinoIcons.mic_fill, size: 16, color: Colors.grey[600]),
              const SizedBox(width: 4),
              Text(
                '${record.audioCount}',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
