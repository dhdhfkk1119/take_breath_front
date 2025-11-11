import 'dart:io';

class RecordSaveRequest {
  final String title;
  final String content;
  final List<File> imageFiles;
  final List<File> audioFiles;
  final List<File> videoFiles;

  RecordSaveRequest({
    required this.title,
    required this.content,
    this.imageFiles = const [],
    this.audioFiles = const [],
    this.videoFiles = const [],
  });
}
