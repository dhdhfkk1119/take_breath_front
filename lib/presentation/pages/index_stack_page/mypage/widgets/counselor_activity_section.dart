import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../schedule_page/counselor_schedule_page.dart';
import '../review_page/counselor_review_list_page.dart';
import '../earnings_page/counselor_earnings_page.dart';
import '../history_page/counselor_history_page.dart';

class CounselorActivitySection extends StatelessWidget {
  const CounselorActivitySection({
    Key? key,
  }) : super(key: key);

  void _handleSchedule(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CounselorSchedulePage(),
      ),
    );
  }

  void _handleReviews(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CounselorReviewListPage(),
      ),
    );
  }

  void _handleEarnings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CounselorEarningsPage(),
      ),
    );
  }

  void _handleHistory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CounselorHistoryPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '나의 활동',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          // 2x2 그리드
          Row(
            children: [
              Expanded(
                child: _buildActivityButton(
                  icon: CupertinoIcons.calendar,
                  label: '상담 일정',
                  onPressed: () => _handleSchedule(context),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildActivityButton(
                  icon: CupertinoIcons.star_fill,
                  label: '상담 후기',
                  onPressed: () => _handleReviews(context),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildActivityButton(
                  icon: CupertinoIcons.money_dollar,
                  label: '수익 현황',
                  onPressed: () => _handleEarnings(context),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildActivityButton(
                  icon: CupertinoIcons.chat_bubble_text,
                  label: '상담 이력',
                  onPressed: () => _handleHistory(context),
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
              color: Colors.blue,
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
