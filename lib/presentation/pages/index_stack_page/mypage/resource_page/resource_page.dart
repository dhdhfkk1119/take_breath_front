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
    return 'https://img.youtube.com/vi/$videoId/hqdefault.jpg';
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
      {
        'title': '직장인 괴롭힘 예방 교육',
        'description': '직장 내 괴롭힘 예방 교육영상',
        'youtubeUrl': 'https://www.youtube.com/watch?v=qcqjRb3m7k8&t=3s',
        'duration': '39분15초',
      },
      {
        'title': '직장인 괴롭힘 예방 교육',
        'description': '나만 무시하는 동료 때문에 하루하루가 지옥 같을 때!',
        'youtubeUrl': 'https://www.youtube.com/watch?v=0xAH1onGyi8',
        'duration': '7분2초',
      },
      {
        'title': '직장인 괴롭힘 예방 교육',
        'description': '직장 내 괴롭힘의 사례와 처리 절차!! 쉽게 알아보는 직장 내 괴롭힘 금지제도',
        'youtubeUrl': 'https://www.youtube.com/watch?v=CuPrUAyK9iY',
        'duration': '10분44초',
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
