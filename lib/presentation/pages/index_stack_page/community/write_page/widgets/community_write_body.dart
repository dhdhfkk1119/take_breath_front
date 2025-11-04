import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/constants/custom_text_area.dart';
import 'package:take_breath/_core/constants/custom_text_button.dart';
import 'package:take_breath/_core/constants/custom_text_form_field.dart';
import 'package:take_breath/_core/utils/closable_info_box.dart';
import 'package:take_breath/_core/utils/image_picker_list.dart';
import 'package:take_breath/domain/community/models/community_write.dart';
import 'package:take_breath/domain/community/providers/community_list_notifier.dart';
import 'package:take_breath/domain/community/providers/community_write_notifier.dart';
import 'package:take_breath/domain/provider/image_picker_list_provider.dart';

class CommunityWriteBody extends ConsumerStatefulWidget {
  const CommunityWriteBody({super.key});

  @override
  ConsumerState<CommunityWriteBody> createState() => _CommunityWriteBodyState();
}

class _CommunityWriteBodyState extends ConsumerState<CommunityWriteBody> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
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
              CustomTextFormField(controller: _textController, hint: "제목입력"),
              SizedBox(height: 8),
              CustomTextArea(
                  controller: _contentController, hint: "공유할 내용 입력 500자 이내 작성"),
              ImagePickerList(),
              CustomTextButton(
                text: notifier.isLoading ? "게시 중..." : "공유 글 게시",
                click: notifier.isLoading
                    ? null
                    : () async {
                        final write = CommunityWrite(
                          title: _textController.text,
                          content: _contentController.text,
                          categoryId: 1,
                          images: imageListNotifier
                              .map((xfile) => File(xfile.path))
                              .toList(),
                        );
                        await notifier.save(write);
                        if (notifier.error != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text("게시물 작성 실패: ${notifier.error}")),
                          );
                          print("${notifier.error}");
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("게시물 작성 성공")),
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
