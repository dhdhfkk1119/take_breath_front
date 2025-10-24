import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CounselorHistoryPage extends StatelessWidget {
  const CounselorHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 임시 데이터
    final List<Map<String, dynamic>> histories = [
      {
        'date': '2024.01.22',
        'clientName': '김OO',
        'duration': '50분',
        'topic': '직장 내 괴롭힘 대처법',
        'fee': '₩80,000',
      },
      {
        'date': '2024.01.20',
        'clientName': '이OO',
        'duration': '50분',
        'topic': '업무 스트레스 관리',
        'fee': '₩80,000',
      },
      {
        'date': '2024.01.18',
        'clientName': '박OO',
        'duration': '30분',
        'topic': '초기 상담',
        'fee': '₩50,000',
      },
      {
        'date': '2024.01.15',
        'clientName': '최OO',
        'duration': '50분',
        'topic': '대인관계 개선',
        'fee': '₩80,000',
      },
      {
        'date': '2024.01.12',
        'clientName': '강OO',
        'duration': '50분',
        'topic': '자존감 향상',
        'fee': '₩80,000',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('상담 이력'),
        centerTitle: true,
        elevation: 0,
      ),
      body: histories.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.chat_bubble_text,
                    size: 48,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '상담 이력이 없습니다',
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
              itemCount: histories.length,
              itemBuilder: (context, index) {
                final history = histories[index];
                return _buildHistoryCard(history);
              },
            ),
    );
  }

  Widget _buildHistoryCard(Map<String, dynamic> history) {
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
              Text(
                history['date'],
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                history['fee'],
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(
                CupertinoIcons.person_fill,
                size: 16,
                color: Colors.grey[600],
              ),
              const SizedBox(width: 6),
              Text(
                history['clientName'],
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 12),
              Icon(
                CupertinoIcons.clock,
                size: 16,
                color: Colors.grey[600],
              ),
              const SizedBox(width: 6),
              Text(
                history['duration'],
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '주제: ${history['topic']}',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
