import 'package:flutter/material.dart';

class CommunityListSearchAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback onCancel;
  final TextEditingController controller;
  final ValueChanged<String>? onSubmitted;

  const CommunityListSearchAppBar({
    super.key,
    required this.onCancel,
    required this.controller,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // 뒤로가기 버튼 -> 검색 모드 종료 역할
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: onCancel, // 부모에서 전달받은 종료 함수 호출
      ),
      title: TextField(
        controller: controller,
        autofocus: true, // 검색 모드 진입 시 자동 포커스
        decoration: const InputDecoration(
          hintText: "검색어를 입력하세요...",
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.white70),
        ),
        style: const TextStyle(color: Colors.white, fontSize: 18.0),
        onSubmitted: onSubmitted, // 검색 실행 로직을 부모로 전달할 수도 있습니다.
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            // 검색어 지우기
            controller.clear();
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
