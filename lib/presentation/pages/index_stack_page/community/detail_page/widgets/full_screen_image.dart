import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:take_breath/_core/utils/my_http.dart';
import 'package:take_breath/domain/community/models/community_image.dart'; // Gallery를 위해 추가

class FullScreenImage extends StatefulWidget {
  final List<CommunityImage> imageUrls; // 이미지 URL 목록으로 변경
  final int initialIndex; // 처음 보여줄 이미지의 인덱스

  const FullScreenImage({
    super.key,
    required this.imageUrls,
    this.initialIndex = 0, // 기본값은 0 (첫 번째 이미지)
  });

  @override
  State<FullScreenImage> createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {
  late PageController _pageController; // PageViewGallery를 위한 컨트롤러
  late int _currentIndex; // 현재 보고 있는 이미지의 인덱스

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        // X 버튼을 이미지 위에 띄우기 위해 Stack 사용
        children: [
          // 1. PhotoViewGallery를 사용하여 여러 이미지 슬라이드 및 줌 기능 제공
          PhotoViewGallery.builder(
            pageController: _pageController,
            itemCount: widget.imageUrls.length,
            builder: (context, index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(
                    imageLocalUrl + widget.imageUrls[index].imageUrl),
                minScale: PhotoViewComputedScale.contained * 0.8, // 최소 줌 스케일
                maxScale: PhotoViewComputedScale.covered * 2, // 최대 줌 스케일
                heroAttributes: PhotoViewHeroAttributes(
                    tag: widget
                        .imageUrls[index]), // Hero 애니메이션을 위해 tag 추가 (선택 사항)
              );
            },
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            scrollPhysics: const BouncingScrollPhysics(), // 스크롤 물리 효과
            backgroundDecoration: const BoxDecoration(color: Colors.black),
          ),

          // 2. 닫기 (X) 버튼
          Positioned(
            top: MediaQuery.of(context).padding.top + 10, // 상단 상태바 아래에 위치
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          // 3. 현재 이미지 인덱스 표시 (예: 1/5)
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 20, // 하단 패딩 위
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "${_currentIndex + 1} / ${widget.imageUrls.length}",
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
