import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class UserPostListPage extends StatelessWidget {
  const UserPostListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 임시 데이터 (실제로는 서버에서 가져옴)
    final List<Map<String, dynamic>> posts = [
      {
        'id': 1,
        'title': '직장에서 상사의 부당한 지시를 받았어요',
        'content': '매일 퇴근 후에도 계속 업무 지시를 받고 있습니다. 어떻게 대처해야 할까요?',
        'date': '2024.01.20',
        'likes': 12,
        'comments': 5,
        'views': 145,
      },
      {
        'id': 2,
        'title': '팀 내 따돌림을 당하고 있습니다',
        'content': '새로 들어간 팀에서 동료들이 저를 무시하는 것 같습니다. 정말 힘들어요.',
        'date': '2024.01.18',
        'likes': 8,
        'comments': 3,
        'views': 98,
      },
      {
        'id': 3,
        'title': '과도한 업무량으로 스트레스를 받고 있어요',
        'content': '월 100시간 이상 야근을 하고 있는 상황입니다. 건강이 악화되는 것 같습니다.',
        'date': '2024.01.15',
        'likes': 15,
        'comments': 7,
        'views': 210,
      },
      {
        'id': 4,
        'title': '성희롱으로 인한 심리적 고통',
        'content': '직장에서 동료로부터 성적으로 모욕적인 말을 계속 들었습니다.',
        'date': '2024.01.10',
        'likes': 20,
        'comments': 9,
        'views': 320,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('내 글'),
        centerTitle: true,
        elevation: 0,
      ),
      body: posts.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.doc_text,
                    size: 48,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '작성한 글이 없습니다',
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
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return _buildPostCard(context, post);
              },
            ),
    );
  }

  Widget _buildPostCard(BuildContext context, Map<String, dynamic> post) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('글 상세 페이지: ${post['title']}')),
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
            // 제목
            Text(
              post['title'],
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            // 내용
            Text(
              post['content'],
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[700],
                height: 1.4,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            // 날짜 및 통계
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  post['date'],
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[600],
                  ),
                ),
                Row(
                  children: [
                    _buildStatItem(
                      icon: CupertinoIcons.heart,
                      count: post['likes'],
                    ),
                    const SizedBox(width: 12),
                    _buildStatItem(
                      icon: CupertinoIcons.chat_bubble,
                      count: post['comments'],
                    ),
                    const SizedBox(width: 12),
                    _buildStatItem(
                      icon: CupertinoIcons.eye,
                      count: post['views'],
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
