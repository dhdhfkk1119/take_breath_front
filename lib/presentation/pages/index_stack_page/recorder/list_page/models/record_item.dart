import 'package:freezed_annotation/freezed_annotation.dart';

part 'record_item.freezed.dart';

@freezed
class RecordItem with _$RecordItem {
  const factory RecordItem({
    required int id,
    required String title,
    required String content,
    required String date,
    required int imageCount,
    required int audioCount,
  }) = _RecordItem;
}

// Extension으로 update 메서드 추가
extension RecordItemExtension on RecordItem {
  RecordItem update({
    required String title,
    required String content,
    required int imageCount,
    required int audioCount,
  }) =>
      copyWith(
        title: title,
        content: content,
        imageCount: imageCount,
        audioCount: audioCount,
      );
}
