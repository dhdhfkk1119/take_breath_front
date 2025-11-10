import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/counselor/providers/counselor_list_notifier.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(counselorListProvider.notifier).fetchFirstPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.watch(counselorListProvider);

    // 1. 로딩 중이거나 데이터가 아직 null인 경우
    if (notifier.isLoading || notifier.data == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('상담사 리스트'),
          centerTitle: true,
          elevation: 0,
        ),
        body: const Center(
          // 데이터 로딩 중임을 사용자에게 보여줍니다.
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('상담사 리스트'),
        centerTitle: true,
        elevation: 0,
      ),
      body: CounselorListBody(
        counselors: notifier.data!.content,
        onLoadMore: () {
          ref.read(counselorListProvider.notifier).fetchNextPage();
        },
      ),
    );
  }
}
