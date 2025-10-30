import 'package:flutter/material.dart';
import '../list_page/models/record_item.dart';
import '../write_page/recorder_write_page.dart';
import 'widgets/recorder_detail_app_bar.dart';
import 'widgets/recorder_detail_header.dart';
import 'widgets/recorder_detail_content.dart';
import 'widgets/recorder_detail_image_grid.dart';
import 'widgets/recorder_detail_audio_list.dart';

class RecorderDetailPage extends StatefulWidget {
  final RecordItem record;

  const RecorderDetailPage({
    Key? key,
    required this.record,
  }) : super(key: key);

  @override
  State<RecorderDetailPage> createState() => _RecorderDetailPageState();
}

class _RecorderDetailPageState extends State<RecorderDetailPage> {
  late RecordItem record;

  @override
  void initState() {
    super.initState();
    record = widget.record;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RecorderDetailAppBar(
        onDelete: () => _handleDelete(context),
        onEdit: () => _handleEdit(context),
        onExport: () => _handleDownload(context),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RecorderDetailHeader(record: record),
              const SizedBox(height: 24),
              RecorderDetailContent(content: record.content),
              const SizedBox(height: 24),
              if (record.imageCount > 0) ...[
                const Text(
                  '사진',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 12),
                RecorderDetailImageGrid(imageCount: record.imageCount),
                const SizedBox(height: 24),
              ],
              if (record.audioCount > 0) ...[
                const Text(
                  '음성 녹음',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 12),
                RecorderDetailAudioList(audioCount: record.audioCount),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _handleDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('기록 삭제'),
        content: const Text('이 기록을 삭제하시겠습니까?\n삭제된 기록은 복구할 수 없습니다.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('기록이 삭제되었습니다')),
              );
            },
            child: const Text('삭제', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _handleEdit(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecorderWritePage(
          editingRecord: record,
        ),
      ),
    ).then((updatedRecord) {
      // 쓰기 페이지에서 돌아올 때 업데이트된 기록을 받음
      if (updatedRecord != null && updatedRecord is RecordItem) {
        setState(() {
          record = updatedRecord;
        });
      }
    });
  }

  void _handleDownload(BuildContext context) async {
    // 로딩 표시
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await Future.delayed(const Duration(seconds: 2)); // 더미 딜레이

      Navigator.pop(context); // 로딩 닫기

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('다운로드가 완료되었습니다'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      Navigator.pop(context); // 로딩 닫기

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('다운로드 실패: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
