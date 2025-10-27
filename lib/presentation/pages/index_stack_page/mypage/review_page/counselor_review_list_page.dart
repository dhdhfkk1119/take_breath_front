import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CounselorReviewListPage extends StatelessWidget {
  const CounselorReviewListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 임시 데이터
    final List<Map<String, dynamic>> reviews = [
      {
        'rating': 5.0,
        'author': '김상담자',
        'date': '2024.01.22',
        'comment': '상담이 정말 도움이 되었어요. 전문적이고 공감해주셔서 감사합니다.',
      },
      {
        'rating': 4.5,
        'author': '이상담자',
        'date': '2024.01.20',
        'comment': '매우 친절하고 실질적인 조언을 해주셨습니다.',
      },
      {
        'rating': 5.0,
        'author': '박상담자',
        'date': '2024.01.18',
        'comment': '상담 받은 후 마음이 한결 가벼워졌습니다.',
      },
      {
        'rating': 4.0,
        'author': '최상담자',
        'date': '2024.01.15',
        'comment': '명확한 설명과 좋은 조언 감사합니다.',
      },
      {
        'rating': 5.0,
        'author': '강상담자',
        'date': '2024.01.12',
        'comment': '이분이 최고예요. 강력 추천합니다!',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('상담 후기'),
        centerTitle: true,
        elevation: 0,
      ),
      body: reviews.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.star,
                    size: 48,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '후기가 없습니다',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                final review = reviews[index];
                return _buildReviewCard(review);
              },
            ),
    );
  }

  Widget _buildReviewCard(Map<String, dynamic> review) {
    return Container(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ...List.generate(
                    5,
                    (index) => Icon(
                      index < review['rating'].toInt()
                          ? CupertinoIcons.star_fill
                          : CupertinoIcons.star,
                      size: 16,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    review['rating'].toString(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Text(
                review['date'],
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            review['author'],
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            review['comment'],
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[700],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
