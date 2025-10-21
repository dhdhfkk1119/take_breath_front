import 'package:flutter/material.dart';
import '../recoder_list_page.dart';
import 'recorder_list_item.dart';

class RecorderListBody extends StatelessWidget {
  final List<RecordItem> records;

  const RecorderListBody({
    Key? key,
    required this.records,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: records.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return RecorderListItem(record: records[index]);
      },
    );
  }
}
