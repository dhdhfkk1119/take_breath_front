import 'package:flutter/material.dart';
import 'recorder_list_item.dart';
import '../models/record_item.dart';

class RecorderListBody extends StatefulWidget {
  final String filterType;
  final DateTime? selectedDate;

  const RecorderListBody({
    super.key,
    this.filterType = 'all',
    this.selectedDate,
  });

  @override
  State<RecorderListBody> createState() => _RecorderListBodyState();
}

class _RecorderListBodyState extends State<RecorderListBody> {
  final List<RecordItem> records = [
    RecordItem(
      id: 1,
      title: "오늘도 힘든 하루였다",
      content: "상사의 부당한 지시로 인해...",
      date: "2024.01.15",
      imageCount: 2,
      audioCount: 1,
    ),
    RecordItem(
      id: 2,
      title: "회의 중 불쾌한 발언",
      content: "성차별적인 발언을 들었다",
      date: "2024.01.14",
      imageCount: 0,
      audioCount: 2,
    ),
    RecordItem(
      id: 3,
      title: "야근 강요 기록",
      content: "또 다시 야근을 강요당했다. 이번이 벌써...",
      date: "2024.01.13",
      imageCount: 1,
      audioCount: 0,
    ),
    RecordItem(
      id: 4,
      title: "부당한 업무 지시",
      content: "내 업무 범위가 아닌데 계속 시킨다",
      date: "2024.01.12",
      imageCount: 3,
      audioCount: 1,
    ),
    RecordItem(
      id: 5,
      title: "부당한 업무 지시",
      content: "내 업무 범위가 아닌데 계속 시킨다",
      date: "2024.01.12",
      imageCount: 3,
      audioCount: 1,
    ),
    RecordItem(
      id: 6,
      title: "야근 강요 기록",
      content: "또 다시 야근을 강요당했다. 이번이 벌써...",
      date: "2024.01.13",
      imageCount: 1,
      audioCount: 0,
    ),
  ];

  void _onRecordUpdated() {
    setState(() {});
  }

  List<RecordItem> _getFilteredRecords() {
    List<RecordItem> filtered = records;

    if (widget.selectedDate != null) {
      String selectedDateStr =
          "${widget.selectedDate!.year}.${widget.selectedDate!.month.toString().padLeft(2, '0')}.${widget.selectedDate!.day.toString().padLeft(2, '0')}";
      filtered =
          filtered.where((record) => record.date == selectedDateStr).toList();
    }

    switch (widget.filterType) {
      case 'week':
        filtered = filtered.where((record) {
          DateTime recordDate = _parseDate(record.date);
          DateTime now = DateTime.now();
          DateTime weekAgo = now.subtract(const Duration(days: 7));
          return recordDate.isAfter(weekAgo) && recordDate.isBefore(now);
        }).toList();
        break;
      case 'month':
        filtered = filtered.where((record) {
          DateTime recordDate = _parseDate(record.date);
          DateTime now = DateTime.now();
          return recordDate.year == now.year && recordDate.month == now.month;
        }).toList();
        break;
      case 'image':
        filtered = filtered.where((record) => record.imageCount > 0).toList();
        break;
      case 'audio':
        filtered = filtered.where((record) => record.audioCount > 0).toList();
        break;
      case 'all':
      default:
        break;
    }

    return filtered;
  }

  DateTime _parseDate(String dateStr) {
    List<String> parts = dateStr.split('.');
    return DateTime(
      int.parse(parts[0]),
      int.parse(parts[1]),
      int.parse(parts[2]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredRecords = _getFilteredRecords();

    if (filteredRecords.isEmpty) {
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
        itemCount: filteredRecords.length,
        itemBuilder: (context, index) {
          return RecorderListItem(
            record: filteredRecords[index],
            onRecordUpdated: _onRecordUpdated,
          );
        },
      ),
    );
  }
}
