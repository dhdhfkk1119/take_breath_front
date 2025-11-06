// Dart (community_update.dart)
import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'community_update.freezed.dart';

@freezed
class CommunityUpdate with _$CommunityUpdate {
  const factory CommunityUpdate({
    required String title,
    required String content,
    @Default(null) int? categoryId,
    @Default(null) List<File>? images,
    @Default(const []) List<int> deleteImageIds,
  }) = _CommunityUpdate;
}
