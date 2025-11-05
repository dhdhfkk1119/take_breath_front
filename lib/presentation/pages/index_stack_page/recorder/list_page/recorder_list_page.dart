import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/presentation/pages/index_stack_page/recorder/list_page/widgets/recorder_filter_bar.dart';
import 'package:take_breath/presentation/pages/index_stack_page/recorder/list_page/widgets/recorder_list_app_bar.dart';
import 'package:take_breath/presentation/pages/index_stack_page/recorder/list_page/widgets/recorder_search_bar.dart';
import '../../../../../domain/recorder/providers/recorder_provider.dart';
import '../detail_page/recorder_detail_page.dart';
import '../write_page/recorder_write_page.dart';
import '../../../../../presentation/pages/notification/notification_page.dart';

class RecorderListPage extends ConsumerWidget {
  const RecorderListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(currentPageProvider);
    final searchKeyword = ref.watch(searchKeywordProvider);

    // 검색 중이면 검색 결과, 아니면 목록
    final recordsAsync =
        searchKeyword == '__SEARCH_MODE__' || searchKeyword.isEmpty
            ? (searchKeyword == '__SEARCH_MODE__'
                ? ref.watch(searchRecordsProvider(''))
                : ref.watch(recordListProvider(currentPage)))
            : ref.watch(searchRecordsProvider(searchKeyword));

    return Scaffold(
      appBar: _buildAppBar(context, ref, searchKeyword),
      body: recordsAsync.when(
        data: (records) {
          if (records.isEmpty) {
            return Center(
              child: Text(
                searchKeyword.isEmpty ? '기록이 없습니다' : '검색 결과가 없습니다',
              ),
            );
          }

          return ListView.builder(
            itemCount: records.length,
            itemBuilder: (context, index) {
              final record = records[index];
              return _buildRecordListTile(context, ref, record);
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RecorderWritePage(),
            ),
          ).then((result) {
            if (result != null) {
              // 글쓰기 후 목록 새로고침
              ref.refresh(recordListProvider(0));
            }
          });
        },
        backgroundColor: const Color(0xFF0891B2),
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(
    BuildContext context,
    WidgetRef ref,
    String searchKeyword,
  ) {
    if (searchKeyword.isNotEmpty) {
      // 검색 중 - SearchAppBar 표시
      final TextEditingController controller = TextEditingController();
      controller.text = searchKeyword;

      return RecorderListSearchAppBar(
        controller: controller,
        onCancel: () {
          ref.read(searchKeywordProvider.notifier).state = '';
        },
        onSubmitted: (query) {
          ref.read(searchKeywordProvider.notifier).state = query;
        },
      );
    } else {
      // 일반 모드 - AppBar 표시
      return RecorderListAppBar(
        onSearchPressed: () {
          // 검색 모드 활성화
          ref.read(searchKeywordProvider.notifier).state = '__SEARCH_MODE__';
        },
        onCalendarPressed: () {
          _showDatePicker(context);
        },
        onFilterPressed: () {
          _showFilterDialog(context);
        },
        onNotificationPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NotificationPage(),
            ),
          );
        },
      );
    }
  }

  Widget _buildRecordListTile(
      BuildContext context, WidgetRef ref, dynamic record) {
    return GestureDetector(
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
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
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
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 이미지 영역 - 백엔드에서 불러온 실제 이미지
                  _buildImageThumbnail(ref, record),
                  const SizedBox(width: 12),
                  // 텍스트 영역
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 제목
                        Text(
                          record.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        // 내용
                        Text(
                          record.content,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 6),
                        // 날짜
                        Text(
                          record.date,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  // 파일 카운트 영역
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // 이미지 카운트
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.image,
                            size: 16,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(width: 3),
                          Text(
                            record.imageCount.toString(),
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      // 음성 카운트
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.mic,
                            size: 16,
                            color: Colors.blue,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            record.audioCount.toString(),
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageThumbnail(WidgetRef ref, dynamic record) {
    final recordDetailAsync = ref.watch(recordDetailProvider(record.id));

    return recordDetailAsync.when(
      data: (recordDetail) {
        final imageFiles = recordDetail['imageFiles'] as List?;

        if (imageFiles != null && imageFiles.isNotEmpty) {
          final firstImage = imageFiles[0] as Map;
          final imageUrl = (firstImage['filePath'] ?? '') as String;

          if (imageUrl.isNotEmpty) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.image,
                      color: Colors.grey[600],
                      size: 40,
                    ),
                  );
                },
              ),
            );
          }
        }

        // 이미지가 없는 경우
        return Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.image,
            color: Colors.grey[600],
            size: 40,
          ),
        );
      },
      loading: () => Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
      error: (error, stack) => Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          Icons.image,
          color: Colors.grey[600],
          size: 40,
        ),
      ),
    );
  }

  void _showDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('선택된 날짜: ${picked.toString().split(' ')[0]}')),
      );
    }
  }

  void _showFilterDialog(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecorderListFilter(
          onFilterApplied: (selectedCategory) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('필터: $selectedCategory')),
            );
          },
          initialCategory: 'all',
        ),
      ),
    );
  }
}
