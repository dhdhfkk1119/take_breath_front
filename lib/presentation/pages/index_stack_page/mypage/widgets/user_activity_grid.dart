import 'package:flutter/material.dart';
import '../charge_page/widgets/user_activity_button.dart';

class UserActivityGrid extends StatelessWidget {
  // 포인트 충전 & 내역
  final VoidCallback onPointChargePressed;
  final VoidCallback onPointHistoryPressed;

  // 기존 액티비티
  final VoidCallback onPostListPressed;
  final VoidCallback onFavoriteListPressed;
  final VoidCallback onCommentHistoryPressed;
  final VoidCallback onReportHistoryPressed;

  const UserActivityGrid({
    Key? key,
    required this.onPointChargePressed,
    required this.onPointHistoryPressed,
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
        children: [
          Row(
            children: [
              Expanded(
                child: UserActivityButton(
                  icon: Icons.description_outlined,
                  label: '글목록',
                  onPressed: onPostListPressed,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: UserActivityButton(
                  icon: Icons.favorite_border,
                  label: '찜목록',
                  onPressed: onFavoriteListPressed,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // 세 번째 줄: 댓글 내역 & 신고 내역
          Row(
            children: [
              Expanded(
                child: UserActivityButton(
                  icon: Icons.comment_outlined,
                  label: '댓글 내역',
                  onPressed: onCommentHistoryPressed,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: UserActivityButton(
                  icon: Icons.warning_outlined,
                  label: '신고 내역',
                  onPressed: onReportHistoryPressed,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // 네 번째 줄: 충전 내역만 (왼쪽)
          Row(
            children: [
              Expanded(
                child: UserActivityButton(
                  icon: Icons.history,
                  label: '충전 내역',
                  onPressed: onPointHistoryPressed,
                ),
              ),
              const SizedBox(width: 12),
              // 오른쪽 빈칸
              Expanded(
                child: SizedBox(
                  height: 80,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
