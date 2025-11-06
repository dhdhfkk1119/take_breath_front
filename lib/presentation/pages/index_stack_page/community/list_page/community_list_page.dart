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
        _searchController.clear();
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
              builder: (context) => CommunityWritePage(),
            ),
          ).then((_) {
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
