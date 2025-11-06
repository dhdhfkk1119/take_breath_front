import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/constants/custom_color.dart';
import 'package:take_breath/_core/constants/custom_showDialog.dart';
import 'package:take_breath/_core/constants/custom_text_form_field.dart';
import 'package:take_breath/_core/utils/report_target_type.dart';
import 'package:take_breath/_core/utils/snackbar_util.dart';
import 'package:take_breath/_core/utils/widgets_app_bar.dart';
import 'package:take_breath/domain/comment/models/community_comment_request.dart';
import 'package:take_breath/domain/comment/providers/community_comment_write_notifier.dart';
import 'package:take_breath/domain/community/providers/community_detail_notifier.dart';
import 'package:take_breath/domain/community/providers/community_list_notifier.dart';
import 'package:take_breath/domain/member/providers/member_login_notifier.dart';
import 'package:take_breath/domain/member/providers/member_repository_provider.dart';
import 'package:take_breath/presentation/pages/index_stack_page/community/detail_page/widgets/community_detail_item.dart';
import 'package:take_breath/presentation/pages/index_stack_page/community/write_page/community_write_page.dart';

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
    _scrollController.addListener(_onScroll);
    Future.microtask(() =>
        ref.read(communityDetailProvider.notifier).fetchDetail(widget.id));
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      ref.read(communityDetailProvider.notifier).fetchDetail(widget.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(communityDetailProvider);
    final member = ref.watch(memberProvider);
    final isOwner = state.value?.memberId == member?.id;

    return Scaffold(
      appBar: WidgetsAppBar(
        title: "상세 페이지",
        icon: const Icon(Icons.more_vert),
        menuItems: [
          if (!isOwner)
            BottomMenuItem(
              title: "신고하기",
              icon: const Icon(Icons.report),
              onTap: () {
                showReportBottomSheet(
                  context: context,
                  onReport: () {},
                  targetType: ReportTargetType.post,
                  targetId: widget.id,
                  ref: ref,
                );
              },
            ),
          if (isOwner)
            BottomMenuItem(
              title: "수정",
              icon: const Icon(Icons.edit, color: Colors.blue),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CommunityWritePage(
                      detail: state.value,
                    ),
                  ),
                );
              },
            ),
          if (isOwner)
            BottomMenuItem(
              title: "삭제",
              icon: const Icon(Icons.delete, color: Colors.red),
              onTap: () async {
                try {
                  final String deleteMessage = await ref
                      .read(communityDetailProvider.notifier)
                      .deletePost(widget.id);
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, "/main");
                  await ref.read(communityListProvider.notifier).refreshList();
                  SnackBarUtil.showSuccess(context, deleteMessage);
                } catch (e) {
                  SnackBarUtil.showError(context, e.toString());
                }
              },
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
                          onPressed: () async {
                            await ref
                                .read(communityCommentWriteProvider.notifier)
                                .saveComment(
                                    communityDetail.id,
                                    CommunityCommentRequest(
                                        content: commentController.text));
                            await ref
                                .read(communityDetailProvider.notifier)
                                .fetchDetail(communityDetail.id);
                            commentController.clear();
                          },
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
