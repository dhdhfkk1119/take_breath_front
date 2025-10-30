import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../notification/notification_page.dart';
import '../write_page/recorder_write_page.dart';
import 'widgets/recorder_list_app_bar.dart';
import 'widgets/recorder_list_body.dart';
import 'widgets/recorder_search_bar.dart';

class RecorderListPage extends StatefulWidget {
  const RecorderListPage({super.key});

  @override
  State<RecorderListPage> createState() => _RecorderListPageState();
}

class _RecorderListPageState extends State<RecorderListPage> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  DateTime? _selectedDate;
  String _filterType = 'all'; // all, week, month, image, audio

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
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
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
    bool isSelected = _filterType == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          _filterType = value;
        });
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey[200]!,
            ),
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
    return Scaffold(
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
        filterType: _filterType,
        selectedDate: _selectedDate,
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'recorder_list_fab',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RecorderWritePage(),
            ),
          ).then((_) {
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

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
