import 'package:flutter/material.dart';
import 'package:take_breath/_core/utils/widgets_app_bar.dart';
import 'package:take_breath/presentation/pages/index_stack_page/community/write_page/widgets/community_write_body.dart';

class CommunityWritePage extends StatelessWidget {
  const CommunityWritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetsAppBar(
        title: "공유 글 작성",
      ),
      body: CommunityWriteBody(),
    );
  }
}
