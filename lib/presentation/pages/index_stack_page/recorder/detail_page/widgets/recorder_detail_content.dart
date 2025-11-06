import 'package:flutter/material.dart';

class RecorderDetailContent extends StatelessWidget {
  final Map<String, dynamic> data;

  const RecorderDetailContent({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 제목
            Text(
              data['title'] ?? '제목 없음',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            // 날짜
            Text(
              data['recordDate'] ?? '',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            // 내용
            Text(data['content'] ?? '내용 없음'),
            const SizedBox(height: 24),
            // 이미지, 오디오, 비디오 섹션
            _buildImageSection(data['imageFiles']),
            _buildAudioSection(data['audioFiles']),
            _buildVideoSection(data['videoFiles']),
          ],
        ),
      ),
    );
  }

  // ========== 이미지 섹션 ==========
  Widget _buildImageSection(List? imageFiles) {
    if (imageFiles == null || imageFiles.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '이미지',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: imageFiles.length,
            itemBuilder: (context, index) {
              final file = imageFiles[index] as Map;
              final imageUrl = (file['filePath'] ?? '') as String;

              if (imageUrl.isEmpty) {
                return Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey[300],
                  child: const Icon(Icons.image_not_supported),
                );
              }

              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey[300],
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 100,
                        height: 100,
                        color: Colors.red[300],
                        child: const Icon(Icons.error),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  // ========== 오디오 섹션 ==========
  Widget _buildAudioSection(List? audioFiles) {
    if (audioFiles == null || audioFiles.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '음성 녹음',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: audioFiles.length,
          itemBuilder: (context, index) {
            final audio = audioFiles[index] as Map;
            final fileName =
                audio['originalFileName'] ?? audio['fileName'] ?? '음성 파일';
            final fileSize = audio['fileSize'] ?? 0;

            return ListTile(
              leading: const Icon(Icons.audio_file),
              title: Text(fileName),
              subtitle: Text('${(fileSize as int) ~/ 1024} KB'),
              trailing: const Icon(Icons.play_arrow),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('음성 재생 기능 준비 중입니다')),
                );
              },
            );
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  // ========== 비디오 섹션 ==========
  Widget _buildVideoSection(List? videoFiles) {
    if (videoFiles == null || videoFiles.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '비디오',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: videoFiles.length,
          itemBuilder: (context, index) {
            final video = videoFiles[index] as Map;
            final fileName =
                video['originalFileName'] ?? video['fileName'] ?? '비디오 파일';
            final fileSize = video['fileSize'] ?? 0;

            return ListTile(
              leading: const Icon(Icons.video_file),
              title: Text(fileName),
              subtitle: Text('${(fileSize as int) ~/ 1024} KB'),
              trailing: const Icon(Icons.play_arrow),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('비디오 재생 기능 준비 중입니다')),
                );
              },
            );
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
