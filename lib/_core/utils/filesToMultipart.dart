// Dart (lib/utils/file_converter.dart)
import 'dart:io';
import 'package:dio/dio.dart';

// List<File>을 서버 전송용 List<MultipartFile>로 변환하는 유틸리티 함수
Future<List<MultipartFile>> filesToMultipartFiles(
    List<File>? imageFiles) async {
  List<MultipartFile> files = [];
  if (imageFiles != null && imageFiles.isNotEmpty) {
    for (File imageFile in imageFiles) {
      files.add(await MultipartFile.fromFile(
        imageFile.path,
        filename: imageFile.path.split('/').last,
      ));
    }
  }
  return files;
}
