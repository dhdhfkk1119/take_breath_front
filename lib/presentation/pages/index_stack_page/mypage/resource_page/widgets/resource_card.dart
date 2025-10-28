import 'package:flutter/material.dart';
import 'youtube_player_page.dart';

class ResourceCard extends StatelessWidget {
  final String title;
  final String description;
  final String youtubeUrl;
  final String duration;
  final String thumbnailUrl;

  const ResourceCard({
    Key? key,
    required this.title,
    required this.description,
    required this.youtubeUrl,
    required this.duration,
    required this.thumbnailUrl,
  }) : super(key: key);

  // 앱 내에서 유튜브 영상 재생
  void _playVideoInApp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => YoutubePlayerPage(
          videoUrl: youtubeUrl,
          title: title,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            // 썸네일 이미지
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey[300],
              child: _buildThumbnail(),
            ),
            // 콘텐츠 (제목, 설명, 시간)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[300],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '시간: $duration',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // 재생 버튼
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => _playVideoInApp(context),
                  child: Center(
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.8),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 썸네일 이미지 빌드 메서드
  Widget _buildThumbnail() {
    return Image.network(
      thumbnailUrl,
      fit: BoxFit.fitWidth,
      filterQuality: FilterQuality.medium,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Container(
          color: Colors.grey[300],
          child: Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          ),
        );
      },
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        print('❌ Thumbnail load failed: $thumbnailUrl');
        print('❌ Error: $exception');
        return Container(
          color: Colors.grey[300],
          child: const Icon(
            Icons.play_circle_outline,
            size: 80,
            color: Colors.grey,
          ),
        );
      },
    );
  }
}
