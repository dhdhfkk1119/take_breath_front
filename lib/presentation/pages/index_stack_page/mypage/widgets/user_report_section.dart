import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class UserReportSection extends StatelessWidget {
  final VoidCallback onNewReport;

  const UserReportSection({
    Key? key,
    required this.onNewReport,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '신고 현황',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          // 신고 버튼
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: onNewReport,
              icon: const Icon(CupertinoIcons.exclamationmark_circle),
              label: const Text('새로운 신고'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[400],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
