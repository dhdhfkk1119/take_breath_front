import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/constants/custom_text_area.dart';
import 'package:take_breath/_core/constants/custom_text_button.dart';
import 'package:take_breath/_core/constants/custom_text_form_field.dart';
import 'package:take_breath/_core/utils/closable_info_box.dart';
import 'package:take_breath/_core/utils/image_picker_list.dart';
import 'package:take_breath/_core/utils/my_http.dart';
import 'package:take_breath/domain/community/models/community_detail.dart';
import 'package:take_breath/domain/community/models/community_image.dart';
import 'package:take_breath/domain/community/models/community_update.dart';
import 'package:take_breath/domain/community/models/community_write.dart';
import 'package:take_breath/domain/community/providers/community_list_notifier.dart';
import 'package:take_breath/domain/community/providers/community_write_notifier.dart';
import 'package:take_breath/domain/provider/image_picker_list_provider.dart';

class CommunityWriteBody extends ConsumerStatefulWidget {
  final CommunityDetail? detail;
  CommunityWriteBody({super.key, this.detail});

  @override
  ConsumerState<CommunityWriteBody> createState() => _CommunityWriteBodyState();
}

class _CommunityWriteBodyState extends ConsumerState<CommunityWriteBody> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late List<CommunityImage> existingImages = [];
  late CommunityDetail detailState;
  List<int> deleteImageIds = [];

  // 처음 들 어올때 데이터 확인
  @override
  void initState() {
    super.initState();
    if (widget.detail != null) {
      existingImages = List.from(widget.detail!.imageUrls);
      _textController.text = widget.detail!.title;
      _contentController.text = widget.detail!.content;
      detailState = widget.detail!;
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _contentController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.watch(communityWriteProvider.notifier);
    final imageListNotifier = ref.watch(imagePickerListProvider);
    final bool isEdit = widget.detail != null;

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClosableInfoBox(
                noticeTitle: "공유 글 작성에 있어서 제한을 제공합니다",
                title1: "1. 실명 및 유추 가능한 말은 제한합니다",
                title2: "2. 너무 비난 과 욕설은 자제 합니다",
              ),
              SizedBox(height: 8),
              CustomTextFormField(
                  controller: _textController,
                  hint: widget.detail?.title ?? ""),
              SizedBox(height: 8),
              CustomTextArea(
                  controller: _contentController,
                  hint: widget.detail?.content ?? ""),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.detail != null &&
                      widget.detail!.imageUrls.isNotEmpty) ...[
                    Text(
                      "기존 이미지",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: List.generate(existingImages.length, (index) {
                        final image = existingImages[index];
                        return Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  imageLocalUrl + image.imageUrl,
                                  width: 75,
                                  height: 75,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 4,
                              top: 4,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    deleteImageIds.add(image.id);

                                    // 기존 리스트 복제 후 해당 index 제거
                                    final updatedImages =
                                        List<CommunityImage>.from(
                                            existingImages);
                                    updatedImages.removeAt(index);

                                    // 상태 업데이트
                                    existingImages = updatedImages;
                                    detailState = detailState.copyWith(
                                        imageUrls: updatedImages);
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                    const SizedBox(height: 16),
                  ],

                  // 새로 추가할 이미지 리스트
                  const ImagePickerList(),
                ],
              ),
              CustomTextButton(
                text: notifier.isLoading
                    ? (isEdit ? "수정 중..." : "게시 중...")
                    : (isEdit ? "수정 완료" : "공유 글 게시"),
                click: notifier.isLoading
                    ? null
                    : () async {
                        if (isEdit) {
                          // 수정용 DTO
                          final update = CommunityUpdate(
                            title: _textController.text.isNotEmpty
                                ? _textController.text
                                : widget.detail!.title,
                            content: _contentController.text.isNotEmpty
                                ? _contentController.text
                                : widget.detail!.content,
                            categoryId: 1,
                            images: imageListNotifier
                                .map((xfile) => File(xfile.path))
                                .toList(),
                            deleteImageIds:
                                deleteImageIds, // 삭제할 이미지 ID가 있으면 여기에
                          );
                          await notifier.update(update, widget.detail!.id);
                        } else {
                          // 작성용 DTO
                          final write = CommunityWrite(
                            title: _textController.text,
                            content: _contentController.text,
                            categoryId: 1,
                            images: imageListNotifier
                                .map((xfile) => File(xfile.path))
                                .toList(),
                          );
                          await notifier.save(write);
                        }

                        // 결과 처리
                        if (notifier.error != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                (isEdit ? "게시물 수정 실패: " : "게시물 작성 실패: ") +
                                    notifier.error!,
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(isEdit ? "게시물 수정 성공" : "게시물 작성 성공"),
                            ),
                          );

                          Navigator.pop(context);
                          Navigator.pushNamed(context, "/main");
                          await ref
                              .read(communityListProvider.notifier)
                              .refreshList();
                          imageListNotifier.clear();
                        }
                      },
              ),
            ],
          ),
        )
      ],
    );
  }
}
