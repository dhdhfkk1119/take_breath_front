import 'package:flutter/material.dart';

class RecorderListFilter extends StatefulWidget {
  final Function(String) onFilterApplied;
  final String initialCategory;

  const RecorderListFilter({
    super.key,
    required this.onFilterApplied,
    this.initialCategory = 'all',
  });

  @override
  State<RecorderListFilter> createState() => _RecorderListFilterState();
}

class _RecorderListFilterState extends State<RecorderListFilter> {
  late String _selectedCategory;

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.initialCategory;
  }

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
          // 유형 필터
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
                _selectedCategory = 'all';
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[200],
              foregroundColor: Colors.black,
            ),
            child: const Text('초기화'),
          ),
          const SizedBox(height: 16),

          // 적용 버튼
          ElevatedButton(
            onPressed: () {
              widget.onFilterApplied(_selectedCategory);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0891B2),
              foregroundColor: Colors.white,
            ),
            child: const Text('적용'),
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
