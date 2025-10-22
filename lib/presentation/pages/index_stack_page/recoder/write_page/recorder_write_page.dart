import 'package:flutter/material.dart';
import '../list_page/models/record_item.dart';
import 'widgets/recorder_write_app_bar.dart';
import 'widgets/recorder_write_title_field.dart';
import 'widgets/recorder_write_content_field.dart';
import 'widgets/recorder_write_image_list.dart';
import 'widgets/recorder_write_audio_list.dart';
import 'widgets/recorder_write_attach_buttons.dart';

class RecorderWritePage extends StatefulWidget {
  final RecordItem? editingRecord;

  const RecorderWritePage({
    Key? key,
    this.editingRecord,
  }) : super(key: key);

  @override
  State<RecorderWritePage> createState() => _RecorderWritePageState();
}

class _RecorderWritePageState extends State<RecorderWritePage> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  List<String> selectedImages = [];
  List<String> selectedAudios = [];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _contentController = TextEditingController();

    // 수정 모드인 경우 기존 데이터 로드
    if (widget.editingRecord != null) {
      _titleController.text = widget.editingRecord!.title;
      _contentController.text = widget.editingRecord!.content;

      // 기존 이미지 개수만큼 로드
      for (int i = 0; i < widget.editingRecord!.imageCount; i++) {
        selectedImages.add('image_${i + 1}');
      }

      // 기존 오디오 개수만큼 로드
      for (int i = 0; i < widget.editingRecord!.audioCount; i++) {
        selectedAudios.add('audio_${i + 1}');
      }
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RecorderWriteAppBar(
        onSave: _saveRecord,
        isEditMode: widget.editingRecord != null,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RecorderWriteTitleField(controller: _titleController),
              const SizedBox(height: 16),
              RecorderWriteContentField(controller: _contentController),
              const SizedBox(height: 24),
              if (selectedImages.isNotEmpty) ...[
                const Text(
                  '사진',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 12),
                RecorderWriteImageList(
                  images: selectedImages,
                  onRemove: (index) {
                    setState(() {
                      selectedImages.removeAt(index);
                    });
                  },
                ),
                const SizedBox(height: 24),
              ],
              if (selectedAudios.isNotEmpty) ...[
                const Text(
                  '음성 녹음',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 12),
                RecorderWriteAudioList(
                  audios: selectedAudios,
                  onRemove: (index) {
                    setState(() {
                      selectedAudios.removeAt(index);
                    });
                  },
                ),
                const SizedBox(height: 24),
              ],
              RecorderWriteAttachButtons(
                onImagePick: () {
                  setState(() {
                    selectedImages.add('image_${selectedImages.length + 1}');
                  });
                },
                onAudioRecord: () {
                  setState(() {
                    selectedAudios.add('audio_${selectedAudios.length + 1}');
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveRecord() {
    if (_titleController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('제목을 입력해주세요')),
      );
      return;
    }

    if (_contentController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('내용을 입력해주세요')),
      );
      return;
    }

    // 수정 모드인 경우 기존 기록 업데이트
    if (widget.editingRecord != null) {
      widget.editingRecord!.update(
        title: _titleController.text,
        content: _contentController.text,
        imageCount: selectedImages.length,
        audioCount: selectedAudios.length,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('기록이 수정되었습니다')),
      );

      // 수정된 기록을 반환하면서 이전 페이지로 이동
      Navigator.pop(context, widget.editingRecord);
    } else {
      // 새로 작성하는 경우
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('기록이 저장되었습니다')),
      );
      Navigator.pop(context);
    }
  }
}
