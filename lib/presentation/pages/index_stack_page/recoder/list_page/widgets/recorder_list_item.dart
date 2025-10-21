import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../recoder_list_page.dart';

class RecorderListItem extends StatelessWidget {
  final RecordItem record;

  const RecorderListItem({
    Key? key,
    required this.record,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: 상세 페이지로 이동
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
            // 썸네일
            _buildThumbnail(),

            // 텍스트 정보
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 제목
                  Text(
                    record.title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),

                  // 내용 미리보기
                  Text(
                    record.content,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),

                  // 날짜 및 아이콘 정보
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
    // 이미지가 있는 경우
    if (record.imageCount > 0) {
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

    // 이미지 없고 음성만 있는 경우
    if (record.audioCount > 0) {
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
          record.date,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[500],
          ),
        ),
        const SizedBox(width: 8),
        if (record.imageCount > 0) ...[
          Icon(
            CupertinoIcons.photo,
            size: 12,
            color: Colors.grey[500],
          ),
          const SizedBox(width: 2),
          Text(
            '${record.imageCount}',
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[500],
            ),
          ),
          const SizedBox(width: 8),
        ],
        if (record.audioCount > 0) ...[
          Icon(
            CupertinoIcons.mic_fill,
            size: 12,
            color: Colors.grey[500],
          ),
          const SizedBox(width: 2),
          Text(
            '${record.audioCount}',
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
