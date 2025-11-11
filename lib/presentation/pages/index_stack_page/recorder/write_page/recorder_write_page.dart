import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import '../../../../../domain/recorder/models/record_item.dart';
import '../../../../../domain/recorder/providers/recorder_provider.dart';
import 'widgets/recorder_write_app_bar.dart';
import 'widgets/recorder_write_title_field.dart';
import 'widgets/recorder_write_content_field.dart';
import 'widgets/recorder_write_image_list.dart';
import 'widgets/recorder_write_audio_list.dart';
import 'widgets/recorder_write_attach_buttons.dart';

class RecorderWritePage extends ConsumerStatefulWidget {
  final RecordItem? editingRecord;

  const RecorderWritePage({
    Key? key,
    this.editingRecord,
  }) : super(key: key);

  @override
  ConsumerState<RecorderWritePage> createState() => _RecorderWritePageState();
}

class _RecorderWritePageState extends ConsumerState<RecorderWritePage> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  List<File> selectedImages = [];
  List<File> selectedAudios = [];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _contentController = TextEditingController();

    if (widget.editingRecord != null) {
      _titleController.text = widget.editingRecord!.title;
      _contentController.text = widget.editingRecord!.content;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _pickAudioFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.audio,
        allowMultiple: true,
      );

      if (result != null && result.files.isNotEmpty) {
        setState(() {
          for (var file in result.files) {
            if (file.path != null) {
              selectedAudios.add(File(file.path!));
            }
          }
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${result.files.length}개의 음성 파일이 추가되었습니다'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('파일 선택 실패: $e')),
      );
    }
  }

  void _handleImagesPicked(List<File> images) {
    setState(() {
      selectedImages.addAll(images);
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(saveRecordProvider, (previous, next) {
      next.when(
        data: (record) {
          if (record != null && mounted) {
            Navigator.of(context, rootNavigator: true).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('기록이 저장되었습니다')),
            );
            Future.delayed(const Duration(milliseconds: 500), () {
              if (mounted) {
                Navigator.pop(context);
              }
            });
          }
        },
        loading: () {},
        error: (error, stackTrace) {
          if (mounted) {
            Navigator.of(context, rootNavigator: true).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('저장 실패: $error')),
            );
          }
        },
      );
    });

    ref.listen(updateRecordProvider, (previous, next) {
      next.when(
        data: (_) {
          if (mounted) {
            Navigator.of(context, rootNavigator: true).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('기록이 수정되었습니다')),
            );
            Future.delayed(const Duration(milliseconds: 500), () {
              if (mounted) {
                Navigator.pop(context);
              }
            });
          }
        },
        loading: () {},
        error: (error, stackTrace) {
          if (mounted) {
            Navigator.of(context, rootNavigator: true).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('수정 실패: $error')),
            );
          }
        },
      );
    });

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
              if (selectedImages.isNotEmpty)
                RecorderWriteImageList(
                  images: selectedImages,
                  onRemove: (index) {
                    setState(() {
                      selectedImages.removeAt(index);
                    });
                  },
                ),
              if (selectedAudios.isNotEmpty)
                RecorderWriteAudioList(
                  audios: selectedAudios,
                  onRemove: (index) {
                    setState(() {
                      selectedAudios.removeAt(index);
                    });
                  },
                ),
              RecorderWriteAttachButtons(
                onImagesPicked: _handleImagesPicked,
                onAudioPicked: _pickAudioFile,
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

    _showLoadingDialog();

    if (widget.editingRecord != null) {
      ref.read(updateRecordProvider.notifier).updateRecord(
            id: widget.editingRecord!.id,
            title: _titleController.text,
            content: _contentController.text,
            imageFiles: selectedImages.isNotEmpty ? selectedImages : null,
            audioFiles: selectedAudios.isNotEmpty ? selectedAudios : null,
            videoFiles: null,
            deletedImageIds: null,
          );
    } else {
      ref.read(saveRecordProvider.notifier).saveRecord(
            title: _titleController.text,
            content: _contentController.text,
            imageFiles: selectedImages.isNotEmpty ? selectedImages : null,
            audioFiles: selectedAudios.isNotEmpty ? selectedAudios : null,
            videoFiles: null,
          );
    }
  }

  void _showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('저장 중...'),
            ],
          ),
        );
      },
    );
  }
}
