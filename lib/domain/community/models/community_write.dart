import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'community_write.freezed.dart';

@freezed
class CommunityWrite with _$CommunityWrite {
  const factory CommunityWrite({
    required String title,
    required String content,
    @Default(0) int? categoryId,
    @Default(null) List<File>? images,
  }) = _CommunityWrite;
}
