import 'package:flutter/material.dart';
import '../../../../../../_core/constants/custom_color.dart';
import '../../../../../../domain/recorder/models/record_filter.dart';

class RecorderListFilter extends StatefulWidget {
  final Function(RecordFilter) onFilterApplied;
  final RecordFilter initialFilter;

  const RecorderListFilter({
    super.key,
    required this.onFilterApplied,
    this.initialFilter = const RecordFilter.initial(),
  });

  @override
  State<RecorderListFilter> createState() => _RecorderListFilterState();
}

class _RecorderListFilterState extends State<RecorderListFilter> {
  late String _selectedCategory;

  @override
  void initState() {
    super.initState();
    // ✅ 초기 필터 상태를 String으로 변환
    if (widget.initialFilter.hasImage == true) {
      _selectedCategory = 'image';
    } else if (widget.initialFilter.hasAudio == true) {
      _selectedCategory = 'audio';
    } else {
      _selectedCategory = 'all';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('필터'),
        backgroundColor: brandAppBarColor,
        surfaceTintColor: Colors.transparent,
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
              // ✅ String을 RecordFilter로 변환
              final filter = _convertToFilter(_selectedCategory);
              widget.onFilterApplied(filter);
              Navigator.pop(context); // ✅ 필터 적용 후 닫기
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

  // ✅ String을 RecordFilter로 변환하는 메서드 추가
  RecordFilter _convertToFilter(String category) {
    switch (category) {
      case 'image':
        return const RecordFilter(hasImage: true);
      case 'audio':
        return const RecordFilter(hasAudio: true);
      case 'all':
      default:
        return const RecordFilter.initial();
    }
  }
}
