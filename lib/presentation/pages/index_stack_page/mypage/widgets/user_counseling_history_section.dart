import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class UserCounselingHistorySection extends StatelessWidget {
  final VoidCallback onViewMore;

  const UserCounselingHistorySection({
    Key? key,
    required this.onViewMore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '상담 이력 (총 5회)',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              GestureDetector(
                onTap: onViewMore,
                child: Icon(
                  CupertinoIcons.right_chevron,
                  size: 16,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildHistoryItem(
            counselorName: '최영희 상담사',
            date: '2024.01.15',
            topic: '직장 내 괴롭힘 대처방법',
            description: '상사의 부당한 지시에 대한 대처법을 상담받았습니다.',
          ),
          const SizedBox(height: 8),
          _buildHistoryItem(
            counselorName: '하윤희 상담사',
            date: '2024.01.10',
            topic: '업무 스트레스 관리',
            description: '업무 과다로 인한 스트레스 해소 방법을 배웠습니다.',
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryItem({
    required String counselorName,
    required String date,
    required String topic,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                counselorName,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            topic,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            description,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[600],
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
