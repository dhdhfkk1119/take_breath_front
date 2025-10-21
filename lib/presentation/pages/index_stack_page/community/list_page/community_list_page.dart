import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_breath/_core/constants/custom_color.dart';
import 'package:take_breath/presentation/pages/index_stack_page/community/list_page/widgets/community_list_app_bar.dart';
import 'package:take_breath/presentation/pages/index_stack_page/community/list_page/widgets/community_list_body.dart';
import 'package:take_breath/presentation/pages/index_stack_page/community/list_page/widgets/community_list_filter.dart';
import 'package:take_breath/presentation/pages/index_stack_page/community/list_page/widgets/community_list_search_app_bar.dart';

class CommunityListPage extends StatefulWidget {
  const CommunityListPage({super.key});

  @override
  State<CommunityListPage> createState() => _CommunityListPageState();
}

class _CommunityListPageState extends State<CommunityListPage> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        // 검색 모드를 닫을 때 검색어 초기화 (선택 사항)
        _searchController.clear();
        // 키보드 닫기 (선택 사항)
        FocusScope.of(context).unfocus();
      }
    });
  }

  void _executeSearch(String query) {
    // 받아온 검색어를 입력
    print("실제 검색 실행: $query");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: CommunityListFilter(),
      ),
      appBar: _isSearching
          ? CommunityListSearchAppBar(
              onCancel: _toggleSearch,
              controller: _searchController,
              onSubmitted: _executeSearch,
            )
          : CommunityListAppBar(
              onSearchPressed: _toggleSearch,
            ),
      body: CommunityListBody(),
      floatingActionButton: IconButton(
        // IconButton을 직접 사용하지 않고, FloatingActionButton 위젯을 사용하는 것이 더 일반적입니다.
        // 하지만 기존의 Icon 스타일을 유지하기 위해 FloatingActionButton.large를 사용할 수도 있습니다.
        icon: const Icon(
          CupertinoIcons.plus_circle_fill,
          size: 50,
        ),
        color: brandBackColor, // 아이콘 색상 직접 지정
        onPressed: () {
          // 작성 페이지로 이동 로직
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
