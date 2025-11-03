import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../domain/recorder/providers/recorder_provider.dart';
import '../detail_page/recorder_detail_page.dart';

class RecorderListPage extends ConsumerWidget {
  const RecorderListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(currentPageProvider);
    final recordListAsync = ref.watch(recordListProvider(currentPage));

    return Scaffold(
      appBar: AppBar(
        title: const Text('기록실'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.refresh(recordListProvider(currentPage));
            },
          ),
        ],
      ),
      body: recordListAsync.when(
        data: (records) {
          if (records.isEmpty) {
            return const Center(child: Text('기록이 없습니다'));
          }

          return ListView.builder(
            itemCount: records.length,
            itemBuilder: (context, index) {
              final record = records[index];
              return ListTile(
                title: Text(record.title),
                subtitle: Text(record.content),
                trailing: Text(
                  '📷${record.imageCount} 🎵${record.audioCount}',
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecorderDetailPage(
                        record: record,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                Text('오류: $error'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    ref.refresh(recordListProvider(currentPage));
                  },
                  child: const Text('다시 시도'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
