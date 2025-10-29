import 'package:flutter/material.dart';
import 'package:take_breath/presentation/pages/index_stack_page/mypage/settings_page/settings_page.dart';
import '../widgets/counselor_profile_section.dart';
import '../widgets/counselor_stats_section.dart';
import '../widgets/counselor_activity_section.dart';
import '../widgets/counselor_review_section.dart';
import '../edit_page/counselor_profile_edit_page.dart';
import '../review_page/counselor_review_list_page.dart';

class CounselorMypageListPage extends StatefulWidget {
  const CounselorMypageListPage({Key? key}) : super(key: key);

  @override
  State<CounselorMypageListPage> createState() =>
      _CounselorMypageListPageState();
}

class _CounselorMypageListPageState extends State<CounselorMypageListPage> {
  // 설정 상태 관리
  bool _notificationEnabled = true;
  bool _isAnonymous = true;

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

  // 설정 버튼 클릭
  void _showSettingsBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return SettingsPage(
          notificationEnabled: _notificationEnabled,
          isAnonymous: _isAnonymous,
          onNotificationChanged: (value) {
            setState(() => _notificationEnabled = value);
          },
          onAnonymousChanged: (value) {
            setState(() => _isAnonymous = value);
          },
        );
      },
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
            foregroundColor: Colors.black,
            actions: [
              // 오른쪽 설정 버튼
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: GestureDetector(
                  onTap: _showSettingsBottomSheet,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.settings,
                      color: Colors.grey[700],
                      size: 24,
                    ),
                  ),
                ),
              ),
            ],
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
