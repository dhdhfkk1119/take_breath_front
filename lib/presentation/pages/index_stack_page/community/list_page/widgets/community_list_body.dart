import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/utils/my_http.dart';
import 'package:take_breath/domain/community/providers/community_list_notifier.dart';
import 'package:take_breath/presentation/pages/index_stack_page/community/list_page/widgets/community_list_item.dart';

class CommunityListBody extends ConsumerStatefulWidget {
  const CommunityListBody({super.key});

  @override
  ConsumerState<CommunityListBody> createState() => _CommunityListBodyState();
}

class _CommunityListBodyState extends ConsumerState<CommunityListBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      ref.read(communityListProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final communityState = ref.watch(communityListProvider);
    return communityState.when(
      data: (posts) {
        if (posts.isEmpty) {
          return const Center(
            child: Text('아직 등록된 데이터가 없습니다'),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            await ref.read(communityListProvider.notifier).refreshList();
          },
          child: ListView.builder(
            itemCount: posts.length +
                (ref.read(communityListProvider.notifier).hasNextPage ? 1 : 0),
            itemBuilder: (context, index) {
              if (index < posts.length) {
                return CommunityListItem(post: posts[index]);
              } else {
                // 마지막 항목은 로딩 인디케이터
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('오류 발생: $err')),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
