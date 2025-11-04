import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/community/providers/community_list_notifier.dart';
import 'package:take_breath/domain/community/providers/search_dto_provider.dart';

class CommunityListSearchAppBar extends ConsumerWidget
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
  Widget build(BuildContext context, WidgetRef ref) {
    final search = ref.watch(searchDtoProvider); // 읽기용 (UI 반영용)
    final searchNotifier = ref.read(searchDtoProvider.notifier); // 수정용

    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: onCancel,
      ),
      title: TextField(
        controller: controller,
        autofocus: true,
        decoration: const InputDecoration(
          hintText: "검색어를 입력하세요...",
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.black),
        ),
        style: const TextStyle(color: Colors.black, fontSize: 18.0),
        onChanged: (value) {
          searchNotifier.state = search.copyWith(keyword: value);
        },
        onSubmitted: (value) async {
          searchNotifier.state = search.copyWith(keyword: value);

          await ref.read(communityListProvider.notifier).refreshList();
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            controller.clear();
            searchNotifier.state = search.copyWith(keyword: null);
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
