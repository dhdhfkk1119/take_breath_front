import 'package:flutter/material.dart';
import 'package:take_breath/_core/constants/custom_text_area.dart';
import 'package:take_breath/_core/constants/custom_text_button.dart';
import 'package:take_breath/_core/constants/custom_text_form_field.dart';

class CommunityWriteBody extends StatefulWidget {
  const CommunityWriteBody({super.key});

  @override
  State<CommunityWriteBody> createState() => _CommunityWriteBodyState();
}

class _CommunityWriteBodyState extends State<CommunityWriteBody> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
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
