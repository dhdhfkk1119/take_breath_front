import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_breath/presentation/pages/index_stack_page/community/list_page/widgets/community_list_app_bar.dart';
import 'package:take_breath/presentation/pages/index_stack_page/community/list_page/widgets/community_list_body.dart';
import 'package:take_breath/presentation/pages/index_stack_page/community/list_page/widgets/community_list_filter.dart';
import 'package:take_breath/presentation/pages/index_stack_page/community/list_page/widgets/community_list_search_app_bar.dart';
import 'package:take_breath/presentation/pages/index_stack_page/community/write_page/community_write_page.dart';

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
      floatingActionButton: FloatingActionButton(
        heroTag: 'community_list_fab',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CommunityWritePage(),
            ),
          ).then((_) {
            // 새로운 기록이 추가되었을 수도 있으므로 리스트 새로고침
            setState(() {});
          });
        },
        backgroundColor: const Color(0xFF0891B2),
        child: const Icon(Icons.add, color: Colors.white),
        shape: const CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
