import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/presentation/pages/index_stack_page/recorder/detail_page/widgets/recorder_detail_app_bar.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import '../../../../../domain/recorder/providers/recorder_provider.dart';
import '../../../../../domain/recorder/models/record_item.dart';
import 'widgets/recorder_detail_content.dart';
import 'widgets/recorder_edit_page.dart';

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
      appBar: RecorderDetailAppBar(
        onEdit: () => _showEditPage(context, ref, recordDetail),
        onExport: () => _downloadPdf(context, ref),
        onDelete: () => _showDeleteConfirmDialog(context, ref, record.id),
      ),
      body: recordDetail.when(
        data: (data) => RecorderDetailContent(data: data),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => _buildErrorWidget(error),
      ),
    );
  }

  Widget _buildErrorWidget(Object error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          Text('오류 발생\n$error'),
        ],
      ),
    );
  }

  // ⭐ PDF 다운로드 기능
  Future<void> _downloadPdf(BuildContext context, WidgetRef ref) async {
    try {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('PDF 다운로드 중...')),
      );

      final repository = ref.read(recordRepositoryProvider);
      final pdfBytes = await repository.downloadRecordPdf(id: record.id);

      // 파일 저장
      final directory = await getDownloadsDirectory();
      if (directory == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('다운로드 폴더를 찾을 수 없습니다')),
        );
        return;
      }

      final filePath =
          '${directory.path}/기록_${record.id}_${DateTime.now().millisecondsSinceEpoch}.pdf';
      final file = File(filePath);
      await file.writeAsBytes(pdfBytes);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('다운로드 완료: ${file.path}')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('다운로드 실패: $e')),
      );
    }
  }

  void _showEditPage(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<Map<String, dynamic>> recordDetail,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecorderEditPage(
          recordId: record.id,
          recordDetail: recordDetail,
          onSaved: () {
            ref.refresh(recordListProvider(0));
            ref.refresh(recordDetailProvider(record.id));
          },
        ),
      ),
    );
  }

  void _showDeleteConfirmDialog(
    BuildContext context,
    WidgetRef ref,
    int recordId,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('기록 삭제'),
        content: const Text('이 기록을 삭제하시겠습니까? 삭제된 기록은 복구할 수 없습니다.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await _deleteRecord(context, ref, recordId);
            },
            child: const Text('삭제', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteRecord(
    BuildContext context,
    WidgetRef ref,
    int recordId,
  ) async {
    try {
      await ref.read(deleteRecordProvider.notifier).deleteRecord(recordId);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('기록이 삭제되었습니다')),
      );
      ref.refresh(recordListProvider(0));
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('삭제 실패: $e')),
      );
    }
  }
}
