import 'package:flutter/material.dart';
import 'widgets/recorder_write_app_bar.dart';
import 'widgets/recorder_write_title_field.dart';
import 'widgets/recorder_write_content_field.dart';
import 'widgets/recorder_write_image_list.dart';
import 'widgets/recorder_write_audio_list.dart';
import 'widgets/recorder_write_attach_buttons.dart';

class RecorderWritePage extends StatefulWidget {
  const RecorderWritePage({Key? key}) : super(key: key);

  @override
  State<RecorderWritePage> createState() => _RecorderWritePageState();
}

class _RecorderWritePageState extends State<RecorderWritePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  List<String> selectedImages = [];
  List<String> selectedAudios = [];

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

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('기록이 저장되었습니다')),
    );
    Navigator.pop(context);
  }
}
