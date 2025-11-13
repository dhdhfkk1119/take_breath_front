import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/constants/custom_color.dart';
import '../../../../../domain/point/providers/point_notifier.dart';
import '../charge_page/point_charge_page.dart';
import '../charge_page/point_history_page.dart';
import '../payment_page/payment_history_page.dart';
import '../widgets/user_activity_grid.dart';
import '../charge_page/widgets/user_point_section.dart';
import '../comment_page/user_comment_list_page.dart';
import '../edit_page/user_profile_edit_page.dart';
import '../favorite_page/user_favorite_list_page.dart';
import '../my_write/user_post_list_page.dart';
import '../new_report/user_report_assistant_page.dart';
import '../report_page/user_report_history_page.dart';
import '../resource_page/resource_page.dart';
import '../settings_page/settings_page.dart';
import '../widgets/user_profile_section.dart';
import '../widgets/user_report_section.dart';
import '../widgets/user_resource_section.dart';

class UserMypageListPage extends ConsumerStatefulWidget {
  const UserMypageListPage({Key? key}) : super(key: key);

  @override
  ConsumerState<UserMypageListPage> createState() => _UserMypageListPageState();
}

class _UserMypageListPageState extends ConsumerState<UserMypageListPage> {
  // 설정 상태 관리
  bool _notificationEnabled = true;
  bool _isAnonymous = true;

  // ========== 페이지 이동 함수들 ==========

  void _handleEditProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const UserProfileEditPage(),
      ),
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
        builder: (context) => const UserCommentListPage(),
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

  void _handleResourcePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ResourcePage(),
      ),
    );
  }

  // ✅ 포인트 충전 페이지
  void _handlePointCharge(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PointChargePage(),
      ),
    );
  }

  // ✅ 포인트 내역 페이지
  void _handlePointHistory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PointHistoryPage(),
      ),
    );
  }

  // ✅ 결제 내역 페이지
  void _handlePaymentHistory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PaymentHistoryPage(),
      ),
    );
  }

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
    // ✅ 포인트 상태 감시
    final pointState = ref.watch(pointProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: brandAppBarColor,
        surfaceTintColor: Colors.transparent,
        title: const Text('프로필'),
        centerTitle: true,
        elevation: 0,
        actions: [
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. 프로필 섹션
            UserProfileSection(
              onEditPressed: () => _handleEditProfile(context),
            ),
            const SizedBox(height: 16),

            // 2. ✅ 포인트 표시 섹션 (프로필 바로 아래)
            UserPointSection(
              totalPoints: pointState.totalPoints,
              onChargePressed: () => _handlePointCharge(context),
            ),
            const SizedBox(height: 20),

            // 3. ✅ 포인트 + 액티비티 그리드 (분리된 위젯)
            UserActivityGrid(
              onPaymentHistoryPressed: () => _handlePaymentHistory(context),
              onPointHistoryPressed: () => _handlePointHistory(context),
              onPostListPressed: () => _handlePostList(context),
              onFavoriteListPressed: () => _handleFavoriteList(context),
              onCommentHistoryPressed: () => _handleCommentHistory(context),
              onReportHistoryPressed: () => _handleReportHistory(context),
            ),
            const SizedBox(height: 20),

            // 4. 자료실 섹션
            UserResourceSection(
              onResourcePressed: () => _handleResourcePage(context),
            ),
            const SizedBox(height: 20),

            // 5. 신고 섹션
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
