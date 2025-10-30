import 'package:flutter/material.dart';

class RecorderDetailContent extends StatelessWidget {
  final String content;

  const RecorderDetailContent({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: const TextStyle(
        fontSize: 16,
        height: 1.6,
      ),
    );
  }
}
