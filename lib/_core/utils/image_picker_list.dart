import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:take_breath/domain/provider/image_picker_list_provider.dart';

class ImagePickerList extends ConsumerStatefulWidget {
  const ImagePickerList({super.key});

  @override
  ConsumerState<ImagePickerList> createState() =>
      _CommunityWriteImageListState();
}

class _CommunityWriteImageListState extends ConsumerState<ImagePickerList> {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(imagePickerListProvider.notifier);
    final images = ref.watch(imagePickerListProvider);

    Future<void> _pickImage() async {
      if (images.length >= 10) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('이미지는 최대 10개까지만 등록할 수 있습니다.')),
        );
        return;
      }

      final pickedFiles = await _picker.pickMultiImage();
      if (pickedFiles.isNotEmpty) {
        notifier.addImages(pickedFiles);
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 이미지 추가 버튼
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
          child: InkWell(
            onTap: _pickImage,
            child: Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.camera_fill,
                    size: 35,
                    color: Colors.grey,
                  ),
                  Text(
                    "${images.length}/10",
                    style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // 이미지 미리보기
        if (images.isNotEmpty)
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Stack(
                    children: [
                      Container(
                        width: 77,
                        height: 77,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.blueAccent,
                            width: 1.0,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.file(
                            File(images[index].path),
                            width: 75,
                            height: 75,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // 삭제 버튼
                      Positioned(
                        top: 4,
                        right: 4,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              images.removeAt(index);
                            });
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.black54,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.close,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
