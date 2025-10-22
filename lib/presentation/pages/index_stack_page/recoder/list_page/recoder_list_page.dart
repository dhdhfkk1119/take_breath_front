import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../write_page/recorder_write_page.dart';
import 'models/record_item.dart';
import 'widgets/recorder_list_app_bar.dart';
import 'widgets/recorder_filter_bar.dart';
import 'widgets/recorder_search_bar.dart';
import 'widgets/recorder_list_body.dart';

class RecorderListPage extends StatefulWidget {
  const RecorderListPage({Key? key}) : super(key: key);

  @override
  State<RecorderListPage> createState() => _RecorderListPageState();
}

class _RecorderListPageState extends State<RecorderListPage> {
  bool showFilter = false;
  bool showSearch = false;
  DateTime? selectedDate;
  List<RecordItem> filteredRecords = [];

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

  @override
  void initState() {
    super.initState();
    filteredRecords = records;
  }

  void _filterRecordsByDate(DateTime? date) {
    setState(() {
      selectedDate = date;
      if (date == null) {
        filteredRecords = records;
      } else {
        // 선택한 날짜와 일치하는 기록만 필터링
        String formattedDate = _formatDateToString(date);
        filteredRecords =
            records.where((record) => record.date == formattedDate).toList();
      }
    });
  }

  String _formatDateToString(DateTime date) {
    return "${date.year}.${date.month.toString().padLeft(2, '0')}.${date.day.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RecorderListAppBar(
        onFilterToggle: () {
          setState(() {
            showFilter = !showFilter;
          });
        },
        onSearchToggle: () {
          setState(() {
            showSearch = !showSearch;
          });
        },
        onDateSelected: _filterRecordsByDate,
      ),
      body: Column(
        children: [
          if (showSearch) const RecorderSearchBar(),
          if (showFilter) const RecorderFilterBar(),
          // 선택된 날짜 표시
          if (selectedDate != null)
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${_formatDateToString(selectedDate!)} 의 기록 (${filteredRecords.length}개)',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF0891B2),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _filterRecordsByDate(null),
                    child: const Icon(
                      CupertinoIcons.xmark_circle_fill,
                      color: Color(0xFF0891B2),
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          Expanded(
            child: RecorderListBody(records: filteredRecords),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RecorderWritePage(),
            ),
          ).then((_) {
            // 새로운 기록이 추가되었을 수도 있으므로 리스트 새로고침
            setState(() {});
          });
        },
        backgroundColor: const Color(0xFF0891B2),
        child: const Icon(Icons.add, color: Colors.white),
        shape: const CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
