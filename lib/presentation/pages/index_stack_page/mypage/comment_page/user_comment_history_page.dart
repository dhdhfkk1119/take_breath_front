import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class UserCommentHistoryPage extends StatelessWidget {
  const UserCommentHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 임시 데이터 (실제로는 서버에서 가져옴)
    final List<Map<String, dynamic>> comments = [
      {
        'id': 1,
        'postTitle': '직장 내 괴롭힘 대처 방법',
        'postAuthor': '직장인A',
        'comment': '정말 유용한 정보 감사합니다! 저도 같은 상황이라 많은 도움이 되었어요.',
        'date': '2024.01.22',
        'likes': 5,
        'replies': 2,
      },
      {
        'id': 2,
        'postTitle': '직장 스트레스 관리 팁',
        'postAuthor': '심리상담사B',
        'comment': '명상과 운동이 정말 효과적이었습니다. 추가로 호흡 운동도 추천합니다.',
        'date': '2024.01.20',
        'likes': 12,
        'replies': 4,
      },
      {
        'id': 3,
        'postTitle': '근로기준법으로 알아보는 부당한 업무 강요',
        'postAuthor': '노동법전문가C',
        'comment': '법적 조치를 어떻게 시작해야 할까요? 상담비는 얼마나 드나요?',
        'date': '2024.01.18',
        'likes': 8,
        'replies': 3,
      },
      {
        'id': 4,
        'postTitle': '성희롱 피해 후 극복 경험기',
        'postAuthor': '직장인D',
        'comment': '용감하게 경험을 공유해주셔서 감사합니다. 저도 힘내겠습니다.',
        'date': '2024.01.15',
        'likes': 15,
        'replies': 5,
      },
      {
        'id': 5,
        'postTitle': '팀 따돌림을 극복한 방법',
        'postAuthor': '직장인E',
        'comment': '비슷한 경험을 했는데 이렇게 극복하신 방법이 도움이 될 것 같습니다.',
        'date': '2024.01.12',
        'likes': 7,
        'replies': 2,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('댓글내역'),
        centerTitle: true,
        elevation: 0,
      ),
      body: comments.isEmpty
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
                    '작성한 댓글이 없습니다',
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
              itemCount: comments.length,
              itemBuilder: (context, index) {
                final comment = comments[index];
                return _buildCommentCard(context, comment);
              },
            ),
    );
  }

  Widget _buildCommentCard(BuildContext context, Map<String, dynamic> comment) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('댓글 상세 페이지: ${comment['postTitle']}')),
        );
      },
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
            // 원글 정보
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.doc_text,
                        size: 14,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          '원글: ${comment['postTitle']}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '작성자: ${comment['postAuthor']}',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // 내 댓글
            Text(
              comment['comment'],
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[800],
                height: 1.5,
              ),
            ),
            const SizedBox(height: 12),
            // 날짜 및 통계
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  comment['date'],
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[600],
                  ),
                ),
                Row(
                  children: [
                    _buildStatItem(
                      icon: CupertinoIcons.heart,
                      count: comment['likes'],
                    ),
                    const SizedBox(width: 12),
                    _buildStatItem(
                      icon: CupertinoIcons.chat_bubble,
                      count: comment['replies'],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem({required IconData icon, required int count}) {
    return Row(
      children: [
        Icon(
          icon,
          size: 14,
          color: Colors.grey[600],
        ),
        const SizedBox(width: 4),
        Text(
          count.toString(),
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
