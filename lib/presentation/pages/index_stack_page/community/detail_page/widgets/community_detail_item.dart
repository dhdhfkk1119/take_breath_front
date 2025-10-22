import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_breath/_core/constants/custom_color.dart';
import 'package:take_breath/_core/constants/custom_text_form_field.dart';
import 'package:take_breath/_core/constants/custom_widget.dart';
import 'package:take_breath/_core/constants/expandableText.dart';

class CommunityDetailItem extends StatefulWidget {
  const CommunityDetailItem({super.key});

  @override
  State<CommunityDetailItem> createState() => _CommunityDetailItemState();
}

class _CommunityDetailItemState extends State<CommunityDetailItem> {
  bool isComment = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
      children: [
        SizedBox(
          width: double.infinity,
          height: 350,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0), // 이미지 모서리를 둥글게 처리
            child: Container(
              color: Colors.grey[300],
              child: const Center(
                child: Icon(
                  CupertinoIcons.photo,
                  size: 40,
                  color: Colors.black45,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "1시간전",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
              CustomWidget.buildTitle("텍스트 제목입니다", size: 24),
              const SizedBox(
                height: 4,
              ),
              ExpandableText(
                text:
                    "텍스트 제목입니다텍스트 제목입니다텍스트 제목입니다텍스텍스트 제목입니다텍스트 제목입니다텍스트 제목입니다텍스텍스트 제목입니다텍스트 제목입니다텍스트 제목입니다텍스텍스트 제목입니다텍스트 제목입니다텍스트 제목입니다텍스텍스트 제목입니다텍스트 제목입니다텍스트 제목입니다텍스텍스트 제목입니다텍스트 제목입니다텍스트 제목입니다텍스텍스트 제목입니다텍스트 제목입니다텍스트 제목입니다텍스텍스트 제목입니다텍스트 제목입니다텍스트 제목입니다텍스텍스트 제목입니다텍스트 제목입니다텍스트 제목입니다텍스텍스트 제목입니다텍스트 제목입니다텍스트 제목입니다텍스",
                size: 12,
                textLength: 500,
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  likeCount(),
                  const SizedBox(width: 10),
                  commentCount(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Divider(height: 1, color: Colors.black12),
              ),
              if (isComment) ...[
                commentInfo(),
              ],
              SizedBox(
                height: 6,
              ),
            ],
          ),
        )
      ],
    ));
  }

  Widget commentInfo() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05), // 거의 투명한 배경
        border: Border.all(
          color: Colors.grey.withOpacity(0.3), // 연한 테두리
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8), // 모서리 둥글게
      ),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomWidget.buildTitle("익명"),
          ExpandableText(
            text: "텍스트 제목입니다텍스트 제목입니다텍스트 제목입니다텍스트 제목입니다텍스트 제목입니다텍스트 제목입니다텍스트 ",
            size: 12,
            textLength: 100,
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }

  // 좋아요 갯수
  Widget likeCount() {
    return Row(
      children: [
        const Icon(CupertinoIcons.heart_fill,
            size: 18, color: Colors.redAccent),
        const SizedBox(width: 2),
        Text('0', style: TextStyle(color: Colors.grey[600], fontSize: 13)),
      ],
    );
  }

  // 댓글 갯수
  Widget commentCount() {
    return InkWell(
      onTap: () {
        setState(() {
          isComment = !isComment;
        });
      },
      child: Row(
        children: [
          Icon(CupertinoIcons.chat_bubble_text_fill,
              size: 18, color: brandBackColor),
          const SizedBox(width: 2),
          Text('0', style: TextStyle(color: Colors.grey[600], fontSize: 13)),
        ],
      ),
    );
  }
}
