import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:take_breath/_core/constants/custom_color.dart';
import 'package:take_breath/_core/constants/custom_text_form_field.dart';
import 'package:take_breath/_core/constants/custom_widget.dart';
import 'package:take_breath/_core/constants/expandableText.dart';
import 'package:take_breath/presentation/pages/index_stack_page/community/detail_page/widgets/full_screen_image.dart';

class CommunityDetailItem extends StatefulWidget {
  const CommunityDetailItem({super.key});

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
                CustomWidget.buildTitle("텍스트 제목입니다", size: 24),
                const SizedBox(height: 4),
                ExpandableText(
                  text:
                      "텍스트 제목입니다텍스트 제목입니다텍스트 제목입니다텍스텍스트 제목입니다텍스트 제목입니다텍스트 제목입니다텍스텍스트 제목입니다텍스트 제목입니다텍스트 제목입니다텍스텍스트 제목입니다텍스트 제목입니다텍스트 제목입니다텍스텍스트 제목입니다텍스트 제목입니다텍스트 제목입니다텍스텍스트 제목입니다텍스트 제목입니다텍스트 제목입니다텍스텍스트 제목입니다텍스트 제목입니다텍스트 제목입니다텍스텍스트 제목입니다텍스트 제목입니다텍스트 제목입니다텍스텍스트 제목입니다텍스트 제목입니다텍스트 제목입니다텍스텍스트 제목입니다텍스트 제목입니다텍스트 제목입니다텍스",
                  size: 12,
                  textLength: 500,
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    likeCount(),
                    const SizedBox(width: 10),
                    commentCount(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Divider(height: 1, color: Colors.black12),
                ),
                if (isComment) ...[
                  commentInfo(),
                ],
                const SizedBox(height: 6),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget commentInfo() {
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
          CustomWidget.buildTitle("익명"),
          ExpandableText(
            text: "텍스트 제목입니다텍스트 제목입니다텍스트 제목입니다텍스트 제목입니다텍스트 제목입니다텍스트 제목입니다텍스트 ",
            size: 12,
            textLength: 100,
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }

  Widget likeCount() {
    return Row(
      children: [
        const Icon(CupertinoIcons.heart_fill,
            size: 18, color: Colors.redAccent),
        const SizedBox(width: 2),
        Text('0', style: TextStyle(color: Colors.grey[600], fontSize: 13)),
      ],
    );
  }

  Widget commentCount() {
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
          Text('0', style: TextStyle(color: Colors.grey[600], fontSize: 13)),
        ],
      ),
    );
  }
}
