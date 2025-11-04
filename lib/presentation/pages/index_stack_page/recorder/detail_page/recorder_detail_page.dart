import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../domain/recorder/providers/recorder_provider.dart';
import '../../../../../domain/recorder/models/record_item.dart';

class RecorderDetailPage extends ConsumerWidget {
  final RecordItem record;

  const RecorderDetailPage({
    Key? key,
    required this.record,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordDetail = ref.watch(recordDetailProvider(record.id));

    return Scaffold(
      appBar: AppBar(title: const Text('기록 상세')),
      body: recordDetail.when(
        data: (data) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['title'] ?? '제목 없음',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    data['recordDate'] ?? '',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  Text(data['content'] ?? '내용 없음'),
                  const SizedBox(height: 24),
                  if ((data['imageFiles'] as List?)?.isNotEmpty ?? false) ...[
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
                        itemCount: data['imageFiles'].length,
                        itemBuilder: (context, index) {
                          final image = data['imageFiles'][index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                image['url'],
                                fit: BoxFit.cover,
                                width: 100,
                                height: 100,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: 100,
                                    height: 100,
                                    color: Colors.grey[300],
                                    child:
                                        const Icon(Icons.image_not_supported),
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
                  if ((data['audioFiles'] as List?)?.isNotEmpty ?? false) ...[
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
                      itemCount: data['audioFiles'].length,
                      itemBuilder: (context, index) {
                        final audio = data['audioFiles'][index];
                        return ListTile(
                          leading: const Icon(Icons.audio_file),
                          title: Text(audio['originalName'] ?? '음성 파일'),
                          subtitle: Text('${(audio['size'] ?? 0) ~/ 1024} KB'),
                          trailing: const Icon(Icons.play_arrow),
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('음성 재생 기능 준비 중입니다')),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ],
              ),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text('오류 발생\n$error'),
            ],
          ),
        ),
      ),
    );
  }
}
