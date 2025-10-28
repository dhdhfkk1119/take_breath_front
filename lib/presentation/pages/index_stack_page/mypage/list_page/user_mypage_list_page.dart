import 'package:flutter/material.dart';
import '../comment_page/user_comment_history_page.dart';
import '../edit_page/user_profile_edit_page.dart';
import '../favorite_page/user_favorite_list_page.dart';
import '../my_write/my_write_page.dart';
import '../new_report/user_report_assistant_page.dart';
import '../report_page/user_report_history_page.dart';
import '../resource_page/resource_page.dart';
import '../settings_page/settings_page.dart';
import '../widgets/user_counseling_history_section.dart';
import '../widgets/user_activity_section.dart';
import '../widgets/user_profile_section.dart';
import '../widgets/user_report_section.dart';
import '../widgets/user_resource_section.dart';

class UserMypageListPage extends StatefulWidget {
  const UserMypageListPage({Key? key}) : super(key: key);

  @override
  State<UserMypageListPage> createState() => _UserMypageListPageState();
}

class _UserMypageListPageState extends State<UserMypageListPage> {
  // 설정 상태 관리
  bool _notificationEnabled = true;
  bool _isAnonymous = true;

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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const UserReportHistoryPage(),
      ),
    );
  }

  void _handleNewReport(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const UserReportAssistantPage(),
      ),
    );
  }

  // 자료실 페이지 이동 ← 새로 추가
  void _handleResourcePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ResourcePage(),
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
      appBar: AppBar(
        title: const Text('프로필'),
        centerTitle: true,
        elevation: 0,
        actions: [
          // 오른쪽 설정 버튼
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              onTap: _showSettingsBottomSheet,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
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
            // 자료실 섹션 ← 새로 추가
            UserResourceSection(
              onResourcePressed: () => _handleResourcePage(context),
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
