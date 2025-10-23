import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_breath/_core/constants/custom_color.dart';
import 'package:take_breath/_core/constants/custom_text_area.dart';
import 'package:take_breath/_core/constants/custom_text_button.dart';
import 'package:take_breath/_core/constants/custom_text_form_field.dart';
import 'package:take_breath/_core/utils/closable_info_box.dart';
import 'package:take_breath/_core/utils/image_picker_list.dart';

class CommunityWriteBody extends StatefulWidget {
  const CommunityWriteBody({super.key});

  @override
  State<CommunityWriteBody> createState() => _CommunityWriteBodyState();
}

class _CommunityWriteBodyState extends State<CommunityWriteBody> {
  final TextEditingController _controller = TextEditingController();
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_isVisible)
                ClosableInfoBox(
                  noticeTitle: "공유 글 작성에 있어서 제한을 제공합니다",
                  title1: "1. 실명 및 유추 가능한 말은 제한합니다",
                  title2: "2. 너무 비난 과 욕설은 자제 합니다",
                ),
              SizedBox(
                height: 8,
              ),
              CustomTextFormField(
                controller: _controller,
                hint: "제목입력",
              ),
              SizedBox(
                height: 8,
              ),
              CustomTextArea(
                controller: _controller,
                hint: "공유할 내용 입력 500자 이내 작성 요함 - 비속어 , 실명 언급 주의 요함 ",
              ),
              ImagePickerList(),
              CustomTextButton(
                text: "공유 글 게시",
                click: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}
