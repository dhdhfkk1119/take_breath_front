import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/counselor/providers/counselor_list_notifier.dart';
import '../../../../../_core/constants/custom_color.dart';
import 'widgets/counselor_list_body.dart';

class CounselorListPage extends ConsumerStatefulWidget {
  const CounselorListPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CounselorListPage> createState() => _CounselorListPageState();
}

class _CounselorListPageState extends ConsumerState<CounselorListPage> {
  @override
  void initState() {
    super.initState();
    // 첫 페이지 데이터 로드
    Future.microtask(() {
      ref.read(counselorListProvider.notifier).fetchFirstPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(counselorListProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: brandAppBarColor,
        surfaceTintColor: Colors.transparent,
        title: const Text('상담사 리스트', style: TextStyle(fontSize: 20),),
        centerTitle: true,
        elevation: 0,
      ),
      body: state.isLoading && state.data == null
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () async {
                await ref.read(counselorListProvider.notifier).fetchFirstPage();
              },
              child: CounselorListBody(
                counselors: state.data?.content ?? [],
                onLoadMore: () async {
                  await ref
                      .read(counselorListProvider.notifier)
                      .fetchNextPage();
                },
                isLoadingMore: state.isLoading,
              ),
            ),
    );
  }
}
