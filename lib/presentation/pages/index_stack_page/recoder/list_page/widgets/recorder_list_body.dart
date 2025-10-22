import 'package:flutter/material.dart';
import '../models/record_item.dart';
import 'recorder_list_item.dart';

class RecorderListBody extends StatefulWidget {
  final List<RecordItem> records;

  const RecorderListBody({
    Key? key,
    required this.records,
  }) : super(key: key);

  @override
  State<RecorderListBody> createState() => _RecorderListBodyState();
}

class _RecorderListBodyState extends State<RecorderListBody> {
  void _onRecordUpdated() {
    setState(() {
      // 기록이 업데이트되었으므로 UI 새로고침
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: widget.records.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return RecorderListItem(
          record: widget.records[index],
          onRecordUpdated: _onRecordUpdated,
        );
      },
    );
  }
}
