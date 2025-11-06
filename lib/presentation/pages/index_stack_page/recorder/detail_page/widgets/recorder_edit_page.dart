import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import '../../../../../../domain/recorder/providers/recorder_provider.dart';

class RecorderEditPage extends ConsumerStatefulWidget {
  final int recordId;
  final AsyncValue<Map<String, dynamic>> recordDetail;
  final VoidCallback onSaved;

  const RecorderEditPage({
    required this.recordId,
    required this.recordDetail,
    required this.onSaved,
  });

  @override
  ConsumerState<RecorderEditPage> createState() => _RecorderEditPageState();
}

class _RecorderEditPageState extends ConsumerState<RecorderEditPage> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  List<File> selectedImages = [];
  List<File> selectedAudios = [];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _contentController = TextEditingController();

    widget.recordDetail.whenData((data) {
      _titleController.text = data['title'] ?? '';
      _contentController.text = data['content'] ?? '';
    });
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          '기록 수정',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: _saveRecord,
            child: const Text(
              '저장',
              style: TextStyle(
                color: Color(0xFF0891B2),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: '제목',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(0),
                ),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _contentController,
                decoration: InputDecoration(
                  hintText: '내용을 입력해주세요',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(0),
                ),
                style: const TextStyle(fontSize: 16),
                maxLines: null,
              ),
              const SizedBox(height: 24),
              _buildImageEditSection(),
              const SizedBox(height: 16),
              _buildAudioEditSection(),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _pickImages,
                      icon: const Icon(Icons.image, color: Color(0xFF0891B2)),
                      label: const Text(
                        '이미지 추가',
                        style: TextStyle(color: Color(0xFF0891B2)),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF0891B2)),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _pickAudios,
                      icon: const Icon(Icons.mic, color: Color(0xFF0891B2)),
                      label: const Text(
                        '음성 추가',
                        style: TextStyle(color: Color(0xFF0891B2)),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF0891B2)),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageEditSection() {
    return widget.recordDetail.when(
      data: (data) {
        final existingImages = (data['imageFiles'] as List?)?.cast<Map>() ?? [];

        if (selectedImages.isEmpty && existingImages.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '이미지',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  // 기존 이미지
                  ...existingImages.map((image) {
                    final imageUrl = image['filePath'] as String? ?? '';
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Stack(
                          children: [
                            Image.network(
                              imageUrl,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: -10,
                              right: -10,
                              child: IconButton(
                                icon: const Icon(Icons.close,
                                    color: Colors.red, size: 24),
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('기존 이미지는 삭제할 수 없습니다'),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  // 새로운 이미지
                  ...selectedImages.map((image) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Stack(
                          children: [
                            Image.file(
                              image,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: -10,
                              right: -10,
                              child: IconButton(
                                icon: const Icon(Icons.close,
                                    color: Colors.red, size: 24),
                                onPressed: () {
                                  setState(() {
                                    selectedImages.remove(image);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  Widget _buildAudioEditSection() {
    if (selectedAudios.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '음성 녹음',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: selectedAudios.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.mic),
              title: Text(selectedAudios[index].path.split('/').last),
              trailing: IconButton(
                icon: const Icon(Icons.close, color: Colors.red),
                onPressed: () {
                  setState(() {
                    selectedAudios.removeAt(index);
                  });
                },
              ),
            );
          },
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Future<void> _pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> images = await picker.pickMultiImage();
    if (images.isNotEmpty) {
      setState(() {
        selectedImages.addAll(images.map((e) => File(e.path)));
      });
    }
  }

  Future<void> _pickAudios() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
      allowMultiple: true,
    );
    if (result != null) {
      setState(() {
        selectedAudios.addAll(result.files.map((e) => File(e.path!)));
      });
    }
  }

  Future<void> _saveRecord() async {
    if (_titleController.text.isEmpty) {
      _showSnackBar('제목을 입력해주세요');
      return;
    }

    if (_contentController.text.isEmpty) {
      _showSnackBar('내용을 입력해주세요');
      return;
    }

    try {
      // ⭐ 변경: newImageFiles → imageFiles (Repository/Provider와 일치)
      await ref.read(updateRecordProvider.notifier).updateRecord(
            id: widget.recordId,
            title: _titleController.text,
            content: _contentController.text,
            imageFiles: selectedImages.isNotEmpty ? selectedImages : null,
            audioFiles: selectedAudios.isNotEmpty ? selectedAudios : null,
            videoFiles: null,
          );

      _showSnackBar('기록이 수정되었습니다');
      widget.onSaved();
      Navigator.pop(context);
    } catch (e) {
      _showSnackBar('수정 실패: $e');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
