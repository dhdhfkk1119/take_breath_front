import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/constants/custom_color.dart';
import 'package:take_breath/_core/constants/custom_showDialog.dart';
import 'package:take_breath/_core/constants/custom_text_form_field.dart';
import 'package:take_breath/_core/constants/custom_widget.dart';
import 'package:take_breath/_core/constants/expandableText.dart';
import 'package:take_breath/_core/utils/formatTime.dart';
import 'package:take_breath/_core/utils/my_http.dart';
import 'package:take_breath/_core/utils/report_target_type.dart';
import 'package:take_breath/_core/utils/snackbar_util.dart';
import 'package:take_breath/domain/comment/models/community_comment_request.dart';
import 'package:take_breath/domain/comment/models/community_comment_response.dart';
import 'package:take_breath/domain/comment/providers/community_comment_write_notifier.dart';
import 'package:take_breath/domain/community/models/community_detail.dart';
import 'package:take_breath/domain/community/providers/community_detail_notifier.dart';
import 'package:take_breath/domain/community/providers/community_list_notifier.dart';
import 'package:take_breath/domain/member/providers/member_login_notifier.dart';
import 'package:take_breath/domain/toggle_like/providers/toggle_like_provider.dart';
import 'package:take_breath/presentation/pages/index_stack_page/community/detail_page/widgets/full_screen_image.dart';

class CommunityDetailItem extends ConsumerStatefulWidget {
  final CommunityDetail communityDetail;

  CommunityDetailItem({super.key, required this.communityDetail});

  @override
  ConsumerState<CommunityDetailItem> createState() =>
      _CommunityDetailItemState();
}

class _CommunityDetailItemState extends ConsumerState<CommunityDetailItem> {
  int currentImageIndex = 0;
  bool isContent = false;
  int commentId = 0;
  final TextEditingController _commentController = TextEditingController();

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final imageList = widget.communityDetail.imageUrls;

    return SafeArea(
      child: ListView(
        children: [
          SizedBox(
            width: double.infinity,
            height: 350,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                imageList.isEmpty
                    ? Center(
                        child: const Icon(Icons.image_not_supported,
                            size: 100, color: Colors.grey),
                      )
                    : PageView.builder(
                        controller: _pageController,
                        itemCount: imageList.length,
                        onPageChanged: (index) {
                          setState(() {
                            currentImageIndex = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => FullScreenImage(
                                    imageUrls: imageList, // 전체 이미지 리스트를 넘겨줍니다.
                                    initialIndex:
                                        index, // 현재 클릭된 이미지의 인덱스를 넘겨줍니다.
                                  ),
                                ),
                              );
                            },
                            child: ClipRRect(
                              child: Image.network(
                                imageLocalUrl + imageList[index].imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                Positioned(
                  bottom: 10,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black45.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      imageList.isEmpty
                          ? "0 / 0"
                          : "${currentImageIndex + 1} / ${imageList.length}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  FormatTime.beforeFormat(widget.communityDetail.createdAt),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                CustomWidget.buildTitle(widget.communityDetail.title, size: 24),
                const SizedBox(height: 4),
                ExpandableText(
                  text: widget.communityDetail.content,
                  size: 12,
                  textLength: 500,
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    likeCount(widget.communityDetail),
                    const SizedBox(width: 10),
                    commentCount(widget.communityDetail),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Divider(height: 1, color: Colors.black12),
                ),
                SizedBox(
                  height: 200, // 원하는 높이
                  child: widget.communityDetail.comments.isEmpty
                      ? const Center(
                          child: Text('아직 등록된 댓글 내역이 없습니다.'),
                        )
                      : ListView.builder(
                          itemCount: widget.communityDetail.comments.length,
                          itemBuilder: (context, index) {
                            return commentInfo(
                                widget.communityDetail.comments[index],
                                ref,
                                context);
                          },
                        ),
                ),
                const SizedBox(height: 6),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget commentInfo(
      CommunityCommentResponse comment, WidgetRef ref, BuildContext context) {
    final member = ref.watch(memberProvider);
    final isOwner = comment.memberId == member?.id;
    if (isContent && commentId == comment.id) {
      _commentController.text = comment.content;
      _commentController.selection = TextSelection.fromPosition(
        TextPosition(offset: _commentController.text.length),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        border: Border.all(
          color: Colors.grey.withOpacity(0.3),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomWidget.buildTitle("${comment.memberName}", size: 14),
              InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  showBottomMenu(
                    context: context,
                    items: [
                      if (!isOwner)
                        BottomMenuItem(
                          title: "댓글 신고하기",
                          icon:
                              const Icon(Icons.report, color: Colors.redAccent),
                          onTap: () {
                            Navigator.pop(context);
                            showReportBottomSheet(
                              context: context,
                              onReport: () {},
                              targetType: ReportTargetType.comment,
                              ref: ref,
                              targetId: comment.id,
                            );
                          },
                        ),
                      if (isOwner)
                        BottomMenuItem(
                          title: "수정",
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onTap: () {
                            Navigator.pop(context);
                            setState(() {
                              isContent = true;
                              commentId = comment.id;
                            });
                          },
                        ),
                      if (isOwner)
                        BottomMenuItem(
                          title: "삭제",
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onTap: () async {
                            try {
                              await ref
                                  .read(communityCommentWriteProvider.notifier)
                                  .deleteComment(comment.id);
                              Navigator.pop(context);
                              await ref
                                  .read(communityDetailProvider.notifier)
                                  .fetchDetail(widget.communityDetail.id);

                              SnackBarUtil.showSuccess(context, "댓글 삭제 되었습니다");
                            } catch (e) {
                              SnackBarUtil.showError(context, e.toString());
                            }
                          },
                        ),
                    ],
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.more_vert,
                    size: 20,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          isContent && commentId == comment.id
              ? Row(
                  children: [
                    Expanded(
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          CustomTextFormField(
                            controller: _commentController,
                            hint: comment.content,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              isDense: true, // 높이 살짝 줄임
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 6),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey, width: 1), // 기본 상태
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: brandBackColor,
                                    width: 1.5), // 클릭 시 색상 변경
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 8,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isContent = false;
                                  _commentController.clear();
                                });
                              },
                              child: Icon(
                                Icons.cancel_outlined,
                                size: 18,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: () async {
                        final updated = _commentController.text.trim();
                        if (updated.isNotEmpty) {
                          await ref
                              .read(communityCommentWriteProvider.notifier)
                              .updateComment(
                                commentId,
                                CommunityCommentRequest(content: updated),
                              );
                          await ref
                              .read(communityDetailProvider.notifier)
                              .fetchDetail(widget.communityDetail.id);
                        }
                        setState(() {
                          isContent = false;
                        });
                      },
                      child: Icon(
                        Icons.send,
                        color: brandBackColor,
                      ),
                    ),
                  ],
                )
              : ExpandableText(
                  text: comment.content,
                  size: 12,
                  textLength: 100,
                ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }

  Widget likeCount(CommunityDetail detail) {
    return InkWell(
      onTap: () async {
        await ref
            .read(communityListProvider.notifier)
            .toggleLikeAndRefresh(detail.id);
      },
      child: Row(
        children: [
          detail.liked
              ? Icon(CupertinoIcons.heart_fill,
                  size: 18, color: Colors.redAccent)
              : Icon(CupertinoIcons.heart, size: 18, color: Colors.redAccent),
          const SizedBox(width: 2),
          Text('${detail.likeCount}',
              style: TextStyle(color: Colors.grey[600], fontSize: 13)),
        ],
      ),
    );
  }

  Widget commentCount(CommunityDetail detail) {
    return Row(
      children: [
        Icon(CupertinoIcons.chat_bubble_text_fill,
            size: 18, color: brandBackColor),
        const SizedBox(width: 2),
        Text('${detail.commentCount}',
            style: TextStyle(color: Colors.grey[600], fontSize: 13)),
      ],
    );
  }
}
