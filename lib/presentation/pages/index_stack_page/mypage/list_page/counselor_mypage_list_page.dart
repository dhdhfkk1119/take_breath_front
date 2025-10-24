import 'package:flutter/material.dart';
import '../widgets/counselor_profile_section.dart';
import '../widgets/counselor_stats_section.dart';
import '../widgets/counselor_activity_section.dart';
import '../widgets/counselor_review_section.dart';
import '../edit_page/counselor_profile_edit_page.dart';
import '../review_page/counselor_review_list_page.dart';

class CounselorMypageListPage extends StatelessWidget {
  const CounselorMypageListPage({Key? key}) : super(key: key);

  void _handleEditProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CounselorProfileEditPage(),
      ),
    );
  }

  void _handleViewMoreReviews(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CounselorReviewListPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('프로필'),
            centerTitle: true,
            elevation: 0,
            pinned: true,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 프로필 섹션
                CounselorProfileSection(
                  onEditPressed: () => _handleEditProfile(context),
                ),
                const SizedBox(height: 20),

                // 통계 섹션 (상담 현황)
                CounselorStatsSection(),
                const SizedBox(height: 20),

                // 활동 섹션 (나의 활동)
                CounselorActivitySection(),
                const SizedBox(height: 20),

                // 후기 섹션 (최근 후기)
                CounselorReviewSection(
                  onViewMore: () => _handleViewMoreReviews(context),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
