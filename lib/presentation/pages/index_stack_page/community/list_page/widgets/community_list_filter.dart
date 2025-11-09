import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/constants/custom_widget.dart';
import 'package:take_breath/domain/category/providers/category_notifier.dart';
import 'package:take_breath/domain/community/models/search_dto.dart';
import 'package:take_breath/domain/community/providers/community_list_notifier.dart';
import 'package:take_breath/domain/community/providers/search_dto_provider.dart';

import '../../../../../../_core/constants/custom_color.dart';

class CommunityListFilter extends ConsumerStatefulWidget {
  const CommunityListFilter({super.key});

  @override
  ConsumerState<CommunityListFilter> createState() =>
      _CommunityListFilterState();
}

class _CommunityListFilterState extends ConsumerState<CommunityListFilter> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(categoryProvider.notifier).getCategoryList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final search = ref.watch(searchDtoProvider); // 읽기용 (UI 반영용)
    final searchNotifier = ref.read(searchDtoProvider.notifier); // 수정용

    final categoryState = ref.watch(categoryProvider);

    final filter = categoryState.data ?? [];

    Widget categoryListContent;

    if (categoryState.isLoading) {
      categoryListContent = const Center(child: CircularProgressIndicator());
    } else if (categoryState.error != null) {
      categoryListContent = Center(
        child: Text('카테고리 로드 오류: ${categoryState.error}'),
      );
    } else {
      categoryListContent = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomWidget.buildTitle(
              '카테고리 선택',
              color: brandFontColor,
            ),
          ),
          ListTile(
            title: const Text('전체'),
            onTap: () async {
              searchNotifier.state = search.copyWith(
                  sortType: CommunityPostSortType.LATEST,
                  keyword: null,
                  categoryIds: []);
              await ref.read(communityListProvider.notifier).refreshList();
              Navigator.pop(context);
            },
          ),
          ...filter.map((category) {
            return ListTile(
              title: Text(category.name),
              onTap: () async {
                searchNotifier.state =
                    search.copyWith(categoryIds: [category.id]);
                await ref.read(communityListProvider.notifier).refreshList();
                Navigator.pop(context);
              },
            );
          }).toList(),
        ],
      );
    }

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

        categoryListContent,

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
          onTap: () async {
            searchNotifier.state =
                search.copyWith(sortType: CommunityPostSortType.LIKES);
            await ref.read(communityListProvider.notifier).refreshList();
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('최신순'),
          onTap: () async {
            searchNotifier.state =
                search.copyWith(sortType: CommunityPostSortType.LATEST);
            await ref.read(communityListProvider.notifier).refreshList();
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('조회순'),
          onTap: () async {
            searchNotifier.state =
                search.copyWith(sortType: CommunityPostSortType.VIEWS);
            await ref.read(communityListProvider.notifier).refreshList();
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
