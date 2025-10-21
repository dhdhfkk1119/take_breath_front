import 'package:flutter/material.dart';
import 'package:take_breath/presentation/pages/index_stack_page/community/list_page/widgets/community_list_item.dart';

class CommunityListBody extends StatefulWidget {
  const CommunityListBody({super.key});

  @override
  State<CommunityListBody> createState() => _CommunityListBodyState();
}

class _CommunityListBodyState extends State<CommunityListBody> {
  final int _itemCount = 10;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: _itemCount,
        itemBuilder: (BuildContext context, int index) {
          return const CommunityListItem();
        },
      ),
    );
  }
}
