import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_breath/_core/constants/custom_color.dart';
import 'package:take_breath/presentation/pages/index_stack_page/community/detail_page/community_detail_page.dart';

import '../../../../../../_core/constants/custom_widget.dart';

class CommunityListItem extends StatelessWidget {
  const CommunityListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CommunityDetailPage(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment:
                CrossAxisAlignment.stretch, // Row의 자식들이 높이를 채우도록 함
            children: [
              SizedBox(
                width: 100,
                height: 100,
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
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // 게시글 제목
                        CustomWidget.buildTitle(
                          "원하는 내용이 여기에 들어갑니다. 최대 두 줄까지 표시하며, 넘치면 ... 처리됩니다. 제목이 길어지면 이렇게 여러 줄을 차지할 수 있습니다.",
                          color: Colors.black,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          size: 16,
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "작성자 | 1시간 전",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end, // 왼쪽부터 정렬
                      children: [
                        // 좋아요
                        Row(
                          children: [
                            const Icon(CupertinoIcons.heart_fill,
                                size: 18, color: Colors.redAccent),
                            const SizedBox(width: 4),
                            Text('0',
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 13)),
                          ],
                        ),

                        const SizedBox(width: 12),

                        // 댓글
                        Row(
                          children: [
                            Icon(CupertinoIcons.chat_bubble_text_fill,
                                size: 18, color: brandBackColor),
                            const SizedBox(width: 4),
                            Text('0',
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 13)),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
