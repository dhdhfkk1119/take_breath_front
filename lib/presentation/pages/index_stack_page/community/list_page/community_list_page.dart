import 'package:flutter/material.dart';
import 'package:take_breath/presentation/pages/index_stack_page/community/list_page/widgets/community_list_app_bar.dart';
import 'package:take_breath/presentation/pages/index_stack_page/community/list_page/widgets/community_list_body.dart';
import 'package:take_breath/presentation/pages/index_stack_page/community/list_page/widgets/community_list_filter.dart';

class CommunityListPage extends StatelessWidget {
  const CommunityListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: CommunityListFilter(),
      ),
      appBar: CommunityListAppBar(),
      body: CommunityListBody(),
    );
  }
}
