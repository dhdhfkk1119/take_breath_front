import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class UserActivitySection extends StatelessWidget {
  final VoidCallback onPostListPressed;
  final VoidCallback onFavoriteListPressed;
  final VoidCallback onCommentHistoryPressed;
  final VoidCallback onReportHistoryPressed;

  const UserActivitySection({
    Key? key,
    required this.onPostListPressed,
    required this.onFavoriteListPressed,
    required this.onCommentHistoryPressed,
    required this.onReportHistoryPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 2x2 그리드
          Row(
            children: [
              Expanded(
                child: _buildActivityButton(
                  icon: CupertinoIcons.doc_text,
                  label: '글목록',
                  onPressed: onPostListPressed,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildActivityButton(
                  icon: CupertinoIcons.heart,
                  label: '찜목록',
                  onPressed: onFavoriteListPressed,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildActivityButton(
                  icon: CupertinoIcons.chat_bubble_text,
                  label: '댓글내역',
                  onPressed: onCommentHistoryPressed,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildActivityButton(
                  icon: CupertinoIcons.exclamationmark_circle,
                  label: '신고내역',
                  onPressed: onReportHistoryPressed,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActivityButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 28,
              color: Colors.teal,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
