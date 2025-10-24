// chat_detail_bottom.dart 파일

import 'package:flutter/material.dart';
import 'package:take_breath/_core/constants/custom_color.dart';

class ChatDetailBottom extends StatelessWidget {
  const ChatDetailBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      color: Colors.white, // 배경색을 명확히 지정
      child: SafeArea(
        top: false, // 상단 SafeArea는 필요 없음
        child: Column(
          children: [
            Divider(),
            Row(
              children: [
                // 파일 첨부 버튼 (예시)
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {},
                ),
                // 텍스트 입력 필드
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "메시지를 입력하세요",
                        border: InputBorder.none, // 테두리 제거
                        isDense: true, // 입력 필드의 높이를 줄임
                      ),
                    ),
                  ),
                ),
                // 전송 버튼
                IconButton(
                  icon: Icon(Icons.send, color: brandBackColor),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
