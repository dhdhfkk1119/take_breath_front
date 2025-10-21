import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RecorderSearchBar extends StatelessWidget {
  const RecorderSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.grey[100],
      child: TextField(
        decoration: InputDecoration(
          hintText: "기록 검색",
          prefixIcon: const Icon(CupertinoIcons.search),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) {
          // TODO: 검색 로직 구현
        },
      ),
    );
  }
}
