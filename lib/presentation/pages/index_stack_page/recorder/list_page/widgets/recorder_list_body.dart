import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/recorder/providers/recorder_provider.dart';
import '../../../../../../domain/recorder/models/recorder_list_item.dart';
import '../../../../../../domain/recorder/models/record_item.dart';

class RecorderListBody extends ConsumerStatefulWidget {
  final List<RecordItem> records;

  const RecorderListBody({
    super.key,
    required this.records,
  });

  @override
  ConsumerState<RecorderListBody> createState() => _RecorderListBodyState();
}

class _RecorderListBodyState extends ConsumerState<RecorderListBody> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;

  late List<RecordItem> _records;

  @override
  void initState() {
    super.initState();
    _records = List.from(widget.records);
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() async {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (!_isLoadingMore) {
        _isLoadingMore = true;

        final currentPage = ref.read(currentPageProvider);
        final nextPage = currentPage + 1;

        ref.read(currentPageProvider.notifier).state = nextPage;

        final newRecords =
            await ref.refresh(recordListProvider(nextPage).future);

        setState(() {
          _records.addAll(newRecords);
        });

        _isLoadingMore = false;
      }
    }
  }

  Future<void> _refresh() async {
    ref.read(currentPageProvider.notifier).state = 0;

    final firstPage = await ref.refresh(recordListProvider(0).future);

    setState(() {
      _records = List.from(firstPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_records.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              '해당하는 기록이 없습니다',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView.builder(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          itemCount: _records.length,
          itemBuilder: (context, index) {
            return RecorderListItem(
              record: _records[index],
              onRecordUpdated: () {},
            );
          },
        ),
      ),
    );
  }
}
