import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/utils/base_state.dart';
import 'package:take_breath/domain/report/comment_report/models/comment_report_response.dart';
import 'package:take_breath/domain/report/community_report/models/community_report_list_response.dart';
import 'package:take_breath/presentation/pages/index_stack_page/mypage/report_page/widgets/report_card.dart';
import '../../../../../domain/report/comment_report/providers/comment_report_list_notifier.dart';
import '../../../../../domain/report/community_report/provider/community_report_list_notifier.dart';

// ========== 메인 페이지 ==========
class UserReportHistoryPage extends ConsumerStatefulWidget {
  const UserReportHistoryPage({Key? key}) : super(key: key);

  @override
  ConsumerState<UserReportHistoryPage> createState() =>
      _UserReportHistoryPageState();
}

class _UserReportHistoryPageState extends ConsumerState<UserReportHistoryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _communityScrollController = ScrollController();
  final ScrollController _commentScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // 초기 데이터 로드
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(communityReportListProvider.notifier).fetchList();
      ref.read(commentReportListProvider.notifier).fetchList();
    });

    // 무한 스크롤 리스너
    _communityScrollController.addListener(_onCommunityScroll);
    _commentScrollController.addListener(_onCommentScroll);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _communityScrollController.dispose();
    _commentScrollController.dispose();
    super.dispose();
  }

  void _onCommunityScroll() {
    if (_communityScrollController.position.pixels >=
        _communityScrollController.position.maxScrollExtent * 0.9) {
      ref.read(communityReportListProvider.notifier).loadMore();
    }
  }

  void _onCommentScroll() {
    if (_commentScrollController.position.pixels >=
        _commentScrollController.position.maxScrollExtent * 0.9) {
      ref.read(commentReportListProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('신고내역'),
        centerTitle: true,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '게시글 신고'),
            Tab(text: '댓글 신고'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildCommunityReportList(),
          _buildCommentReportList(),
        ],
      ),
    );
  }

  // 게시글 신고 목록
  Widget _buildCommunityReportList() {
    final state = ref.watch(communityReportListProvider);

    return _buildReportListView<CommunityReportListResponse>(
      state: state,
      scrollController: _communityScrollController,
      onRefresh: () async {
        await ref.read(communityReportListProvider.notifier).fetchList();
      },
      itemBuilder: (report) => _buildCommunityReportCard(report),
    );
  }

  // 댓글 신고 목록
  Widget _buildCommentReportList() {
    final state = ref.watch(commentReportListProvider);

    return _buildReportListView<CommentReportListDTO>(
      state: state,
      scrollController: _commentScrollController,
      onRefresh: () async {
        await ref.read(commentReportListProvider.notifier).fetchList();
      },
      itemBuilder: (report) => _buildCommentReportCard(report),
    );
  }

  // 공통 리스트 뷰
  Widget _buildReportListView<T>({
    required BaseState<List<T>> state,
    required ScrollController scrollController,
    required Future<void> Function() onRefresh,
    required Widget Function(T) itemBuilder,
  }) {
    // 에러 상태
    if (state.error != null && (state.data == null || state.data!.isEmpty)) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.exclamationmark_triangle,
              size: 48,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              '오류가 발생했습니다',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              state.error!,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[500],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onRefresh,
              child: const Text('다시 시도'),
            ),
          ],
        ),
      );
    }

    // 로딩 중 (첫 로딩)
    if (state.isLoading && (state.data == null || state.data!.isEmpty)) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    // 빈 상태
    if (state.data == null || state.data!.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.exclamationmark_circle,
              size: 48,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              '신고 기록이 없습니다',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      );
    }

    // 리스트
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        controller: scrollController,
        padding: const EdgeInsets.all(16),
        itemCount: state.data!.length + (state.isLoading ? 1 : 0),
        itemBuilder: (context, index) {
          if (index >= state.data!.length) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: CircularProgressIndicator(),
              ),
            );
          }
          return itemBuilder(state.data![index]);
        },
      ),
    );
  }

  // 게시글 신고 카드
  Widget _buildCommunityReportCard(CommunityReportListResponse report) {
    return ReportCard(
      status: report.status.name,
      date: report.createdAt,
      reason: report.reason,
      title: report.postTitle,
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('신고 상세: ${report.postTitle}')),
        );
      },
    );
  }

  // 댓글 신고 카드
  Widget _buildCommentReportCard(CommentReportListDTO report) {
    return ReportCard(
      status: report.status,
      date: report.createdAt,
      reason: report.reason,
      content: report.commentContent,
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('신고 상세: ${report.commentContent}')),
        );
      },
    );
  }
}
