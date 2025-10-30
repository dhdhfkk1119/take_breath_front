import 'package:flutter/material.dart';
import 'recorder_list_item.dart';
import '../models/record_item.dart';

class RecorderListBody extends StatelessWidget {
  final List<RecordItem> records; // ✅ 직접 받기

  const RecorderListBody({
    super.key,
    required this.records,
  });

  @override
  Widget build(BuildContext context) {
    if (records.isEmpty) {
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
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        itemCount: records.length,
        itemBuilder: (context, index) {
          return RecorderListItem(
            record: records[index],
            onRecordUpdated: () {
              // 업데이트 완료 - UI는 자동으로 새로고침됨
            },
          );
        },
      ),
    );
  }
}
