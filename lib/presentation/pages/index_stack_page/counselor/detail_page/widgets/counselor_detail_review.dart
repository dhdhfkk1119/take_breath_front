import 'package:flutter/material.dart';
import 'package:take_breath/domain/counselor/models/counselor_response.dart';

class CounselorDetailReview extends StatefulWidget {
  final CounselorResponse counselor;

  const CounselorDetailReview({
    Key? key,
    required this.counselor,
  }) : super(key: key);

  @override
  State<CounselorDetailReview> createState() => _CounselorDetailReviewState();
}

class _CounselorDetailReviewState extends State<CounselorDetailReview>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 탭
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey[200]!),
            ),
          ),
          child: TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey[600],
            labelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            indicatorColor: Colors.black,
            indicatorWeight: 2,
            tabs: const [
              Tab(text: '상담 후기'),
              Tab(text: '상담사 소개'),
              Tab(text: '상담사 인증'),
            ],
          ),
        ),
        const SizedBox(height: 20),
        // 탭 컨텐츠
        SizedBox(
          height: 800,
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildReviewTab(),
              _buildIntroductionTab(),
              _buildCertificationTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildReviewTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '상담 후기',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          Icons.star_rounded,
                          size: 16,
                          color: Colors.amber,
                        );
                      }),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '평점 / 댓글 갯수',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildReviewItem(
              rating: 5,
              author: '홍길동',
              date: '1달 전',
              badge: 'BEST',
              content:
                  '너무 경청을 잘해주셔서 저도 말을 많이 하게 되었어요. 답변해주신 말씀들이 혼란스러운 마음을 정리하는데 도움이 되었습니다.',
            ),
            const SizedBox(height: 12),
            _buildReviewItem(
              rating: 5,
              author: '카리나',
              date: '2달 전',
              badge: '',
              content:
                  '너무 좋습니다. 답변도 빠르고 자세한 조언을 해주셨습니다. 편하게 이야기할 수 있어서 좋았고, 조언받은 내용을 적용해보겠습니다.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIntroductionTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '심리상담사 소개',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.school,
                        size: 18,
                        color: Colors.orange,
                      ),
                      SizedBox(width: 8),
                      Text(
                        '솔루션을 위한 첫 시작, 15년전 전문가',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '심리상담 직업상 마음이 먼저 신뢰합니다. 저는 고객의 이야기를 들으며 함께하고 싶습니다. 그들의 마음을 이해하고 존중하며 다양한 관점에서 함께 생각해보고자 합니다.\n\n고객의 어려움과 고통을 공감하고 그 안에서 함께 의미를 찾아보려고 합니다. 그러한 과정 속에서 당신이 가진 장점과 가능성을 함께 발견하고자 합니다.\n\n현실과 감정 사이에서 균형 잡힌 이해와 조언을 드릴 수 있도록 최선을 다하겠습니다.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '전문분야 및 경력',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            _buildQualification('심리상담사 1급(상담심리사)', '(한국상담심리학회)'),
            const SizedBox(height: 8),
            _buildQualification('생활심리상담사', ''),
            const SizedBox(height: 8),
            _buildQualification('아동심리상담사', ''),
            const SizedBox(height: 8),
            _buildQualification('부부상담전문가', ''),
          ],
        ),
      ),
    );
  }

  Widget _buildCertificationTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '자격증 및 경력',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            _buildCertificationItem(
              icon: Icons.card_membership,
              title: '심리상담사 1급',
              subtitle: '상담심리사 (한국상담심리학회)',
            ),
            const SizedBox(height: 12),
            _buildCertificationItem(
              icon: Icons.card_membership,
              title: '생활심리상담사',
              subtitle: '자격증 취득 2020년',
            ),
            const SizedBox(height: 12),
            _buildCertificationItem(
              icon: Icons.work,
              title: '경력',
              subtitle: '상담경력 15년 이상',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewItem({
    required int rating,
    required String author,
    required String date,
    required String badge,
    required String content,
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
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        index < rating ? Icons.star_rounded : Icons.star_border,
                        size: 14,
                        color: Colors.amber,
                      );
                    }),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    author,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              if (badge.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.yellow[100],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    badge,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.orange[700],
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            content,
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

  Widget _buildQualification(String title, String subtitle) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[400],
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (subtitle.isNotEmpty)
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[600],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCertificationItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.orange, size: 24),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
