import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../write_page/recorder_write_page.dart';
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
  ];

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
      ),
      body: Column(
        children: [
          if (showSearch) const RecorderSearchBar(),
          if (showFilter) const RecorderFilterBar(),
          Expanded(
            child: RecorderListBody(records: records),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FAB 버튼 클릭됨'); // 디버깅용
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RecorderWritePage(),
            ),
          );
        },
        backgroundColor: const Color(0xFF0891B2),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class RecordItem {
  final int id;
  final String title;
  final String content;
  final String date;
  final int imageCount;
  final int audioCount;

  RecordItem({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
    required this.imageCount,
    required this.audioCount,
  });
}
