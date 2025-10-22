import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../detail_page/recorder_detail_page.dart';
import '../models/record_item.dart';

class RecorderListItem extends StatefulWidget {
  final RecordItem record;
  final VoidCallback onRecordUpdated;

  const RecorderListItem({
    Key? key,
    required this.record,
    required this.onRecordUpdated,
  }) : super(key: key);

  @override
  State<RecorderListItem> createState() => _RecorderListItemState();
}

class _RecorderListItemState extends State<RecorderListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecorderDetailPage(record: widget.record),
          ),
        ).then((_) {
          // 상세 페이지에서 돌아올 때 부모 위젯에 알림
          widget.onRecordUpdated();
        });
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildThumbnail(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.record.title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.record.content,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  _buildMetadata(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThumbnail() {
    if (widget.record.imageCount > 0) {
      return Container(
        width: 80,
        height: 80,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(
          CupertinoIcons.photo,
          color: Colors.grey,
          size: 32,
        ),
      );
    }

    if (widget.record.audioCount > 0) {
      return Container(
        width: 80,
        height: 80,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(
          CupertinoIcons.mic_fill,
          color: Colors.grey,
          size: 32,
        ),
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildMetadata() {
    return Row(
      children: [
        Text(
          widget.record.date,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[500],
          ),
        ),
        const SizedBox(width: 8),
        if (widget.record.imageCount > 0) ...[
          Icon(
            CupertinoIcons.photo,
            size: 12,
            color: Colors.grey[500],
          ),
          const SizedBox(width: 2),
          Text(
            '${widget.record.imageCount}',
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[500],
            ),
          ),
          const SizedBox(width: 8),
        ],
        if (widget.record.audioCount > 0) ...[
          Icon(
            CupertinoIcons.mic_fill,
            size: 12,
            color: Colors.grey[500],
          ),
          const SizedBox(width: 2),
          Text(
            '${widget.record.audioCount}',
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[500],
            ),
          ),
        ],
      ],
    );
  }
}
