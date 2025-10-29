import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../detail_page/recorder_detail_page.dart';
import '../models/record_item.dart';

class RecorderListItem extends StatelessWidget {
  final RecordItem record;
  final VoidCallback onRecordUpdated;

  const RecorderListItem({
    super.key,
    required this.record,
    required this.onRecordUpdated,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecorderDetailPage(record: record),
          ),
        ).then((_) {
          onRecordUpdated();
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 썸네일 (100x100)
              SizedBox(
                width: 100,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(
                        CupertinoIcons.photo,
                        size: 40,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16.0),

              // 컨텐츠
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 제목
                    Text(
                      record.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),

                    // 내용 미리보기 (2줄)
                    Text(
                      record.content,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 6),

                    // 날짜 + 첨부파일 정보 (하단)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // 날짜
                        Text(
                          record.date,
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[500],
                          ),
                        ),

                        // 이미지, 음성 개수
                        Row(
                          children: [
                            if (record.imageCount > 0) ...[
                              Icon(
                                CupertinoIcons.photo,
                                size: 14,
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
                                size: 14,
                                color: const Color(0xFF0891B2),
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
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
