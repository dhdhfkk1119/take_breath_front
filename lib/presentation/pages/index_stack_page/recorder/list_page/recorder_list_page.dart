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
    final selectedDate = ref.watch(selectedDateProvider); // ✅ 추가

    final recordsAsync =
        searchKeyword == '__SEARCH_MODE__' || searchKeyword.isEmpty
            ? (searchKeyword == '__SEARCH_MODE__'
                ? ref.watch(searchRecordsProvider(''))
                : ref.watch(recordListProvider(currentPage)))
            : ref.watch(searchRecordsProvider(searchKeyword));

    return Scaffold(
      appBar: _buildAppBar(
          context, ref, searchKeyword, selectedDate), // ✅ selectedDate 전달
      body: recordsAsync.when(
        data: (records) {
          if (records.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    selectedDate != null // ✅ 추가
                        ? '선택한 날짜에 기록이 없습니다'
                        : (searchKeyword.isEmpty ? '기록이 없습니다' : '검색 결과가 없습니다'),
                  ),
                  if (selectedDate != null) // ✅ 추가
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: ElevatedButton(
                        onPressed: () {
                          ref.read(selectedDateProvider.notifier).state = null;
                          ref.refresh(recordListProvider(0));
                        },
                        child: const Text('필터 초기화'),
                      ),
                    ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: records.length,
            itemBuilder: (context, index) {
              final record = records[index];
              return _buildRecordListTile(context, record);
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
    DateTime? selectedDate, // ✅ 추가
  ) {
    if (searchKeyword.isNotEmpty) {
      final TextEditingController controller = TextEditingController();

      if (searchKeyword == '__SEARCH_MODE__') {
        controller.text = '';
      } else {
        controller.text = searchKeyword;
      }

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
      return RecorderListAppBar(
        onSearchPressed: () {
          ref.read(searchKeywordProvider.notifier).state = '__SEARCH_MODE__';
        },
        onCalendarPressed: () {
          _showDatePicker(context, ref);
        },
        onFilterPressed: () {
          _showFilterDialog(context, ref);
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

  Widget _buildRecordListTile(BuildContext context, dynamic record) {
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
                  _buildImageThumbnail(record),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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

  Widget _buildImageThumbnail(dynamic record) {
    final imageUrl = record.thumbnailUrl;

    if (imageUrl == null || imageUrl.isEmpty) {
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
    }

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

  /// ✅ 달력 선택 다이얼로그 - 수정됨
  void _showDatePicker(BuildContext context, WidgetRef ref) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      ref.read(selectedDateProvider.notifier).state = picked;
      ref.read(currentPageProvider.notifier).state = 0;
      ref.refresh(recordListProvider(0));

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text('선택된 날짜: ${picked.year}년 ${picked.month}월 ${picked.day}일'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    }
  }

  void _showFilterDialog(BuildContext context, WidgetRef ref) {
    final currentFilter = ref.read(recordFilterProvider);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecorderListFilter(
          initialFilter: currentFilter,
          onFilterApplied: (filter) {
            ref.read(recordFilterProvider.notifier).state = filter;
            ref.refresh(recordListProvider(0));
          },
        ),
      ),
    );
  }
}
