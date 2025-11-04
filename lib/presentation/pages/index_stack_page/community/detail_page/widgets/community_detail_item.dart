import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_breath/_core/constants/custom_color.dart';
import 'package:take_breath/_core/constants/custom_widget.dart';
import 'package:take_breath/_core/constants/expandableText.dart';
import 'package:take_breath/domain/comment/models/community_comment_response.dart';
import 'package:take_breath/domain/community/models/community_detail.dart';
import 'package:take_breath/presentation/pages/index_stack_page/community/detail_page/widgets/full_screen_image.dart';

class CommunityDetailItem extends StatefulWidget {
  final CommunityDetail communityDetail;

  CommunityDetailItem({super.key, required this.communityDetail});

  @override
  State<CommunityDetailItem> createState() => _CommunityDetailItemState();
}

class _CommunityDetailItemState extends State<CommunityDetailItem> {
  bool isComment = false;
  int currentImageIndex = 0;

  // 예시 이미지 리스트
  final List<String> images = [
    "https://picsum.photos/600/400?random=1",
    "https://picsum.photos/600/400?random=2",
    "https://picsum.photos/600/400?random=3",
  ];

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
    return SafeArea(
      child: ListView(
        children: [
          SizedBox(
            width: double.infinity,
            height: 350,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: images.length,
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
                              imageUrls: images, // 전체 이미지 리스트를 넘겨줍니다.
                              initialIndex: index, // 현재 클릭된 이미지의 인덱스를 넘겨줍니다.
                            ),
                          ),
                        );
                      },
                      child: ClipRRect(
                        child: Image.network(
                          images[index],
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
                      "${currentImageIndex + 1}/${images.length}",
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
                  "1시간전",
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
                if (isComment)
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
                                  widget.communityDetail.comments[index]);
                            },
                          ),
                  ),
                if (!isComment)
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "댓글을 눌러서 확인 하세요",
                        style: TextStyle(color: brandFontColor, fontSize: 16),
                      ),
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

  Widget commentInfo(CommunityCommentResponse comment) {
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
          CustomWidget.buildTitle("${comment.memberName}"),
          ExpandableText(
            text: "${comment.content} ",
            size: 12,
            textLength: 100,
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }

  Widget likeCount(CommunityDetail detail) {
    return Row(
      children: [
        const Icon(CupertinoIcons.heart_fill,
            size: 18, color: Colors.redAccent),
        const SizedBox(width: 2),
        Text('${detail.likeCount}',
            style: TextStyle(color: Colors.grey[600], fontSize: 13)),
      ],
    );
  }

  Widget commentCount(CommunityDetail detail) {
    return InkWell(
      onTap: () {
        setState(() {
          isComment = !isComment;
        });
      },
      child: Row(
        children: [
          Icon(CupertinoIcons.chat_bubble_text_fill,
              size: 18, color: brandBackColor),
          const SizedBox(width: 2),
          Text('${detail.commentCount}',
              style: TextStyle(color: Colors.grey[600], fontSize: 13)),
        ],
      ),
    );
  }
}
