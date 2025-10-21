import 'package:flutter/material.dart';
import 'package:take_breath/_core/constants/custom_widget.dart';

import '../../../../../../_core/constants/custom_color.dart';

class CommunityListFilter extends StatelessWidget {
  const CommunityListFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        // 상단 헤더
        DrawerHeader(
          decoration: BoxDecoration(
            color: brandBackColor,
          ),
          child: CustomWidget.buildTitle(
            '필터 및 정렬',
            color: Colors.white,
            size: 24,
          ),
        ),

        // --- 카테고리 선택 영역 ---
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomWidget.buildTitle(
            '카테고리 선택',
            color: brandFontColor,
          ),
        ),
        ListTile(
          title: const Text('전체'),
          onTap: () {
            // 필터링 로직 구현
            Navigator.pop(context); // Drawer 닫기
          },
        ),
        ListTile(
          title: const Text('자유 게시판'),
          onTap: () {
            // 필터링 로직 구현
            Navigator.pop(context);
          },
        ),

        const Divider(),

        // --- 정렬 순서 영역 ---
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomWidget.buildTitle(
            '정렬 순서',
            color: brandFontColor,
          ),
        ),
        ListTile(
          title: const Text('인기순'),
          onTap: () {
            // 정렬 로직 구현
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('최신순'),
          onTap: () {
            // 정렬 로직 구현
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
