import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class RecorderWriteImageList extends StatelessWidget {
  final List<File> images;
  final Function(int) onRemove;

  const RecorderWriteImageList({
    Key? key,
    required this.images,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '첨부된 사진',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              images.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Stack(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: FileImage(images[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 4,
                      right: 4,
                      child: GestureDetector(
                        onTap: () => onRemove(index),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.black54,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            CupertinoIcons.xmark,
                            size: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
