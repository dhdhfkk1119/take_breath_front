import 'package:flutter/material.dart';

class RecorderListFilter extends StatefulWidget {
  const RecorderListFilter({super.key});

  @override
  State<RecorderListFilter> createState() => _RecorderListFilterState();
}

class _RecorderListFilterState extends State<RecorderListFilter> {
  DateTime? _selectedDate;
  String _selectedCategory = 'all';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('필터'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 날짜 필터
          const Text(
            '날짜',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: () async {
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
            },
            child: Text(
              _selectedDate != null
                  ? '${_selectedDate!.year}.${_selectedDate!.month.toString().padLeft(2, '0')}.${_selectedDate!.day.toString().padLeft(2, '0')}'
                  : '날짜 선택',
            ),
          ),
          const SizedBox(height: 24),

          // 카테고리 필터
          const Text(
            '유형',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _buildCategoryOption('all', '전체'),
          _buildCategoryOption('image', '이미지 포함'),
          _buildCategoryOption('audio', '음성 포함'),
          const SizedBox(height: 24),

          // 초기화 버튼
          ElevatedButton(
            onPressed: () {
              setState(() {
                _selectedDate = null;
                _selectedCategory = 'all';
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[200],
              foregroundColor: Colors.black,
            ),
            child: const Text('초기화'),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryOption(String value, String label) {
    return RadioListTile(
      title: Text(label),
      value: value,
      groupValue: _selectedCategory,
      onChanged: (newValue) {
        setState(() {
          _selectedCategory = newValue ?? 'all';
        });
      },
    );
  }
}
