import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/utils/base_state.dart';
import 'package:take_breath/domain/counselor/models/counselor_response.dart';
import 'package:take_breath/presentation/pages/index_stack_page/mypage/favorite_page/widgets/counselor_card.dart';
import '../../../../../domain/counselor/providers/like_counselors_provider.dart';

class UserFavoriteListPage extends ConsumerStatefulWidget {
  const UserFavoriteListPage({Key? key}) : super(key: key);

  @override
  ConsumerState<UserFavoriteListPage> createState() =>
      _UserFavoriteListPageState();
}

class _UserFavoriteListPageState extends ConsumerState<UserFavoriteListPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // 초기 데이터 로드
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(likedCounselorsProvider.notifier).fetchList();
    });

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      ref.read(likedCounselorsProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(likedCounselorsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('찜목록'),
        centerTitle: true,
        elevation: 0,
      ),
      body: _buildBody(state),
    );
  }

  Widget _buildBody(BaseState<List<CounselorResponse>> state) {
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
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 8),
            Text(
              state.error!,
              style: TextStyle(fontSize: 12, color: Colors.grey[500]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ref.read(likedCounselorsProvider.notifier).fetchList();
              },
              child: const Text('다시 시도'),
            ),
          ],
        ),
      );
    }

    // 로딩 중 (첫 로딩)
    if (state.isLoading && (state.data == null || state.data!.isEmpty)) {
      return const Center(child: CircularProgressIndicator());
    }

    // 빈 상태
    if (state.data == null || state.data!.isEmpty) {
      return Center(
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
              '찜한 상담사가 없습니다',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      );
    }

    // 리스트
    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(likedCounselorsProvider.notifier).fetchList();
      },
      child: ListView.builder(
        controller: _scrollController,
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
          return CounselorCard(counselor: state.data![index]);
        },
      ),
    );
  }
}
