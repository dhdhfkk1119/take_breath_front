import 'package:flutter/material.dart';

class RecorderListSearchAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback onCancel;
  final TextEditingController controller;
  final Function(String) onSubmitted;

  const RecorderListSearchAppBar({
    super.key,
    required this.onCancel,
    required this.controller,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: const SizedBox.shrink(),
      title: TextField(
        controller: controller,
        autofocus: true,
        decoration: InputDecoration(
          hintText: '기록 검색...',
          hintStyle: TextStyle(color: Colors.grey[400]),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFF0891B2)),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
        ),
        onSubmitted: (query) {
          if (query.isNotEmpty) {
            onSubmitted(query);
          }
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: onCancel,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
