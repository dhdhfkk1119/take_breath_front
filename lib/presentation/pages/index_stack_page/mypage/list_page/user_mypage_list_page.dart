import 'package:flutter/material.dart';
import '../comment_page/user_comment_history_page.dart';
import '../edit_page/user_profile_edit_page.dart';
import '../favorite_page/user_favorite_list_page.dart';
import '../my_write/my_write_page.dart';
import '../widgets/user_counseling_history_section.dart';
import '../widgets/user_profile_section.dart';
import '../widgets/user_activity_section.dart';
import '../widgets/user_report_section.dart';

class UserMypageListPage extends StatelessWidget {
  const UserMypageListPage({Key? key}) : super(key: key);

  void _handleEditProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const UserProfileEditPage(),
      ),
    );
  }

  void _handleViewCounselingHistory(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('상담 이력 상세 페이지로 이동')),
    );
  }

  void _handlePostList(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const UserPostListPage(),
      ),
    );
  }

  void _handleFavoriteList(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const UserFavoriteListPage(),
      ),
    );
  }

  void _handleCommentHistory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const UserCommentHistoryPage(),
      ),
    );
  }

  void _handleReportHistory(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('신고내역 페이지로 이동')),
    );
  }

  void _handleNewReport(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('새로운 신고 페이지로 이동')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('프로필'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 프로필 섹션
            UserProfileSection(
              onEditPressed: () => _handleEditProfile(context),
            ),
            const SizedBox(height: 20),
            // 상담 이력 섹션
            UserCounselingHistorySection(
              onViewMore: () => _handleViewCounselingHistory(context),
            ),
            const SizedBox(height: 20),
            // 액티비티 섹션 (4개 버튼: 글목록, 찜목록, 댓글내역, 신고내역)
            UserActivitySection(
              onPostListPressed: () => _handlePostList(context),
              onFavoriteListPressed: () => _handleFavoriteList(context),
              onCommentHistoryPressed: () => _handleCommentHistory(context),
              onReportHistoryPressed: () => _handleReportHistory(context),
            ),
            const SizedBox(height: 20),
            // 신고 섹션
            UserReportSection(
              onNewReport: () => _handleNewReport(context),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
