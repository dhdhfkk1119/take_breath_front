import 'package:flutter/material.dart';
import 'package:take_breath/presentation/pages/index_stack_page/community/detail_page/widgets/community_detail_app_bar.dart';

class CommunityDetailPage extends StatelessWidget {
  const CommunityDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CommunityDetailAppBar(),
      ),
    );
  }
}
