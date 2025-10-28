import 'package:flutter/material.dart';
import 'widgets/resource_card.dart';

class ResourcePage extends StatelessWidget {
  const ResourcePage({Key? key}) : super(key: key);

  // 유튜브 URL에서 Video ID 추출
  String _extractVideoId(String youtubeUrl) {
    final uri = Uri.parse(youtubeUrl);
    return uri.queryParameters['v'] ?? '';
  }

  // 유튜브 썸네일 URL 생성
  String _getYoutubeThumbnail(String youtubeUrl) {
    final videoId = _extractVideoId(youtubeUrl);
    return 'https://img.youtube.com/vi/$videoId/hqdefault.jpg'; // ← 이렇게 수정!
  }

  @override
  Widget build(BuildContext context) {
    // 교육 자료 데이터
    final List<Map<String, String>> resources = [
      {
        'title': '직장인 괴롭힘 예방 교육',
        'description': '직장 내 괴롭힘 예방 및 대처 방법',
        'youtubeUrl': 'https://www.youtube.com/watch?v=YFnojqczG6E',
        'duration': '16분18초',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('교육 자료실'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: resources.length,
        itemBuilder: (context, index) {
          final resource = resources[index];
          final thumbnailUrl = _getYoutubeThumbnail(resource['youtubeUrl']!);

          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: ResourceCard(
              title: resource['title']!,
              description: resource['description']!,
              youtubeUrl: resource['youtubeUrl']!,
              duration: resource['duration']!,
              thumbnailUrl: thumbnailUrl,
            ),
          );
        },
      ),
    );
  }
}
