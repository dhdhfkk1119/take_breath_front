import 'package:flutter/material.dart';

class ReportCard extends StatelessWidget {
  final String status;
  final String date;
  final String reason;
  final String? title;
  final String? content;
  final VoidCallback onTap;

  const ReportCard({
    Key? key,
    required this.status,
    required this.date,
    required this.reason,
    this.title,
    this.content,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusInfo = _getStatusInfo(status);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 상단: 상태, 날짜
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _StatusBadge(
                  text: statusInfo['text'],
                  color: statusInfo['color'],
                ),
                Text(
                  _formatDate(date),
                  style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // 신고 사유
            _ReasonBadge(reason: reason),
            const SizedBox(height: 10),
            // 제목 또는 내용
            if (title != null)
              Text(
                title!,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            if (content != null)
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  content!,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[700],
                    height: 1.4,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
          ],
        ),
      ),
    );
  }

  // 상태 정보 반환 (PENDING, REJECTED, APPROVED)
  Map<String, dynamic> _getStatusInfo(String status) {
    final upperStatus = status.toUpperCase();

    switch (upperStatus) {
      case 'PENDING':
        return {'text': '대기중', 'color': Colors.orange};
      case 'REJECTED':
        return {'text': '거부', 'color': Colors.red};
      case 'APPROVED':
        return {'text': '승인', 'color': Colors.green};
      default:
        return {'text': status, 'color': Colors.grey};
    }
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final now = DateTime.now();
      final difference = now.difference(date);

      if (difference.inDays == 0) {
        if (difference.inHours == 0) {
          if (difference.inMinutes == 0) {
            return '방금 전';
          }
          return '${difference.inMinutes}분 전';
        }
        return '${difference.inHours}시간 전';
      } else if (difference.inDays < 7) {
        return '${difference.inDays}일 전';
      } else {
        return '${date.year}.${date.month.toString().padLeft(2, '0')}.${date.day.toString().padLeft(2, '0')}';
      }
    } catch (e) {
      return dateString;
    }
  }
}
class _StatusBadge extends StatelessWidget {
  final String text;
  final Color color;

  const _StatusBadge({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}


class _ReasonBadge extends StatelessWidget {
  final String reason;

  const _ReasonBadge({required this.reason});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        reason,
        style: TextStyle(
          fontSize: 11,
          color: Colors.red[700],
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}


