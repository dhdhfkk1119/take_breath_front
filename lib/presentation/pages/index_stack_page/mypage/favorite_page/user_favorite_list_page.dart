import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class UserFavoriteListPage extends StatelessWidget {
  const UserFavoriteListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 임시 데이터 (실제로는 서버에서 가져옴)
    final List<Map<String, dynamic>> favorites = [
      {
        'id': 1,
        'author': '직장인A',
        'title': '직장 내 괴롭힘 대처 방법',
        'content': '상사로부터의 부당한 지시에 어떻게 대처해야 할까요? 법적 조치는 어떻게 하나요?',
        'date': '2024.01.22',
        'likes': 45,
        'comments': 12,
        'views': 320,
      },
      {
        'id': 2,
        'author': '심리상담사B',
        'title': '직장 스트레스 관리 팁',
        'content': '직장에서 받는 스트레스를 효과적으로 관리하는 방법들을 알려드립니다.',
        'date': '2024.01.20',
        'likes': 78,
        'comments': 23,
        'views': 450,
      },
      {
        'id': 3,
        'author': '노동법전문가C',
        'title': '근로기준법으로 알아보는 부당한 업무 강요',
        'content': '과도한 야근과 휴일 없는 업무 지시는 법적으로 문제가 될 수 있습니다.',
        'date': '2024.01.18',
        'likes': 92,
        'comments': 34,
        'views': 580,
      },
      {
        'id': 4,
        'author': '직장인D',
        'title': '성희롱 피해 후 극복 경험기',
        'content': '직장에서의 성희롱 피해로부터 벗어나는 과정을 공유합니다.',
        'date': '2024.01.15',
        'likes': 56,
        'comments': 18,
        'views': 390,
      },
      {
        'id': 5,
        'author': '직장인E',
        'title': '팀 따돌림을 극복한 방법',
        'content': '팀 내 따돌림을 겪었지만 이를 극복한 개인적인 경험을 나눕니다.',
        'date': '2024.01.12',
        'likes': 67,
        'comments': 21,
        'views': 410,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('찜목록'),
        centerTitle: true,
        elevation: 0,
      ),
      body: favorites.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.heart,
                    size: 48,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '찜한 글이 없습니다',
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
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final favorite = favorites[index];
                return _buildFavoriteCard(context, favorite);
              },
            ),
    );
  }

  Widget _buildFavoriteCard(
      BuildContext context, Map<String, dynamic> favorite) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('글 상세 페이지: ${favorite['title']}')),
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
            // 작성자
            Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.grey[300],
                  child: const Icon(
                    CupertinoIcons.person_fill,
                    size: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  favorite['author'],
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // 제목
            Text(
              favorite['title'],
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
              favorite['content'],
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
                  favorite['date'],
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[600],
                  ),
                ),
                Row(
                  children: [
                    _buildStatItem(
                      icon: CupertinoIcons.heart,
                      count: favorite['likes'],
                    ),
                    const SizedBox(width: 12),
                    _buildStatItem(
                      icon: CupertinoIcons.chat_bubble,
                      count: favorite['comments'],
                    ),
                    const SizedBox(width: 12),
                    _buildStatItem(
                      icon: CupertinoIcons.eye,
                      count: favorite['views'],
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
