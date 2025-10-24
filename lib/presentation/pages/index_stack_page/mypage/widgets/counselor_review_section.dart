import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CounselorReviewSection extends StatelessWidget {
  final VoidCallback onViewMore;

  const CounselorReviewSection({
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
                '최근 후기 (총 312개)',
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
          _buildReviewItem(
            rating: 5.0,
            author: '김상담자',
            date: '2024.01.22',
            comment: '상담이 정말 도움이 되었어요. 전문적이고 공감해주셔서 감사합니다.',
          ),
          const SizedBox(height: 8),
          _buildReviewItem(
            rating: 4.5,
            author: '이상담자',
            date: '2024.01.20',
            comment: '매우 친절하고 실질적인 조언을 해주셨습니다.',
          ),
          const SizedBox(height: 8),
          _buildReviewItem(
            rating: 5.0,
            author: '박상담자',
            date: '2024.01.18',
            comment: '상담 받은 후 마음이 한결 가벼워졌습니다.',
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem({
    required double rating,
    required String author,
    required String date,
    required String comment,
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
              Row(
                children: [
                  ...List.generate(
                    5,
                    (index) => Icon(
                      index < rating.toInt()
                          ? CupertinoIcons.star_fill
                          : CupertinoIcons.star,
                      size: 14,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    rating.toString(),
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Text(
                date,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            author,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            comment,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[700],
              height: 1.4,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
