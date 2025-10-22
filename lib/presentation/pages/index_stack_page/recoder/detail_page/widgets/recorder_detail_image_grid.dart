import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RecorderDetailImageGrid extends StatelessWidget {
  final int imageCount;

  const RecorderDetailImageGrid({
    Key? key,
    required this.imageCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          imageCount,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                CupertinoIcons.photo,
                color: Colors.grey,
                size: 32,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
