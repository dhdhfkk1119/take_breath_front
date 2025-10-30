import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/presentation/pages/index_stack_page/recorder/list_page/widgets/recorder_search_bar.dart';
import '../../../notification/notification_page.dart';
import '../write_page/recorder_write_page.dart';
import 'models/recorder_notifier.dart';
import 'widgets/recorder_list_app_bar.dart';
import 'widgets/recorder_list_body.dart';

class RecorderListPage extends ConsumerStatefulWidget {
  const RecorderListPage({super.key});

  @override
  ConsumerState<RecorderListPage> createState() => _RecorderListPageState();
}

class _RecorderListPageState extends ConsumerState<RecorderListPage> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        _searchController.clear();
        FocusScope.of(context).unfocus();
      }
    });
  }

  void _showCalendar() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      ref.read(recorderProvider.notifier).setSelectedDate(picked);
    }
  }

  void _showFilterMenu() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '필터',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildFilterOption('all', '전체', Icons.all_inbox),
            _buildFilterOption('week', '이번주', Icons.calendar_today),
            _buildFilterOption('month', '이번달', Icons.calendar_month),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            _buildFilterOption('image', '사진 있음', CupertinoIcons.photo),
            _buildFilterOption('audio', '음성 있음', CupertinoIcons.mic_fill),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterOption(String value, String label, IconData icon) {
    final currentFilter = ref.watch(recorderProvider).filterType;
    bool isSelected = currentFilter == value;

    return GestureDetector(
      onTap: () {
        ref.read(recorderProvider.notifier).setFilter(value);
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey[200]!),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? const Color(0xFF0891B2) : Colors.grey[400],
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? const Color(0xFF0891B2) : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            const Spacer(),
            if (isSelected)
              const Icon(
                CupertinoIcons.checkmark_alt,
                color: Color(0xFF0891B2),
              ),
          ],
        ),
      ),
    );
  }

  void _showNotification() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NotificationPage(),
      ),
    );
  }

  void _executeSearch(String query) {
    print("기록 검색 실행: $query");
  }

  @override
  Widget build(BuildContext context) {
    final recorderState = ref.watch(recorderProvider);
    final filteredRecords = ref.watch(filteredRecordsProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _isSearching
          ? RecorderListSearchAppBar(
              onCancel: _toggleSearch,
              controller: _searchController,
              onSubmitted: _executeSearch,
            )
          : RecorderListAppBar(
              onSearchPressed: _toggleSearch,
              onCalendarPressed: _showCalendar,
              onFilterPressed: _showFilterMenu,
              onNotificationPressed: _showNotification,
            ),
      body: RecorderListBody(
        records: filteredRecords,
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'recorder_list_fab',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RecorderWritePage(),
            ),
          ).then((_) {});
        },
        backgroundColor: const Color(0xFF0891B2),
        child: const Icon(Icons.add, color: Colors.white),
        shape: const CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
