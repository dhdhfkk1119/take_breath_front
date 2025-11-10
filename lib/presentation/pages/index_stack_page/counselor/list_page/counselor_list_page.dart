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
  Widget build(BuildContext context) {
    final notifier = ref.watch(counselorListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('상담사 리스트'),
        centerTitle: true,
        elevation: 0,
      ),
      body: notifier.data == null
          ? const Center(child: CircularProgressIndicator())
          : CounselorListBody(counselors: notifier.data!.content),
    );
  }
}
