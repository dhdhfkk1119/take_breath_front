import 'package:flutter/material.dart';

class RecorderFilterBar extends StatelessWidget {
  const RecorderFilterBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.grey[100],
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildFilterChip("전체"),
            const SizedBox(width: 8),
            _buildFilterChip("이번 주"),
            const SizedBox(width: 8),
            _buildFilterChip("이번 달"),
            const SizedBox(width: 8),
            _buildFilterChip("사진있음"),
            const SizedBox(width: 8),
            _buildFilterChip("음성있음"),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}
