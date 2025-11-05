import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/constants/custom_color.dart';
import 'package:take_breath/_core/constants/custom_showDialog.dart';
import 'package:take_breath/_core/constants/custom_text_form_field.dart';
import 'package:take_breath/_core/utils/widgets_app_bar.dart';
import 'package:take_breath/domain/community/providers/community_detail_notifier.dart';
import 'package:take_breath/domain/community/providers/community_repository_provider.dart';
import 'package:take_breath/presentation/pages/index_stack_page/community/detail_page/widgets/community_detail_item.dart';

class CommunityDetailPage extends ConsumerStatefulWidget {
  final int id;
  CommunityDetailPage({super.key, required this.id});

  @override
  ConsumerState<CommunityDetailPage> createState() =>
      _CommunityDetailPageState();
}

class _CommunityDetailPageState extends ConsumerState<CommunityDetailPage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        ref.read(communityDetailProvider.notifier).fetchDetail(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(communityDetailProvider); // 계속 상태 관리

    return Scaffold(
      appBar: WidgetsAppBar(
        title: "상세 페이지",
        icon: const Icon(Icons.more_vert),
        menuItems: [
          BottomMenuItem(
            title: "신고하기",
            icon: const Icon(Icons.report),
            onTap: () {
              showReportBottomSheet(
                context: context,
                onReport: () {},
                postId: 1,
              );
            },
          ),
          BottomMenuItem(
            title: "수정",
            icon: const Icon(Icons.edit, color: Colors.blue),
            onTap: () {},
          ),
          BottomMenuItem(
            title: "삭제",
            icon: const Icon(Icons.delete, color: Colors.red),
            onTap: () {},
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: state.when(
        data: (communityDetail) {
          if (communityDetail == null) {
            return const Center(
              child: Text(
                "게시물이 삭제되었거나 존재하지 않습니다.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: CommunityDetailItem(
                  communityDetail: communityDetail,
                ),
              ),
              AnimatedPadding(
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeOut,
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: SafeArea(
                  top: false,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 45,
                            child: CustomTextFormField(
                              controller: commentController,
                              hint: "댓글 달기",
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.send),
                          color: brandBackColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text("에러 발생: $err")),
      ),
    );
  }
}
