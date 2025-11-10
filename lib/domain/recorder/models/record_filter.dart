class RecordFilter {
  final bool? hasImage;
  final bool? hasAudio;
  final bool? hasVideo;

  const RecordFilter({
    this.hasImage,
    this.hasAudio,
    this.hasVideo,
  });

  // 초기값 (모든 필터 null = 전체 보기)
  const RecordFilter.initial()
      : hasImage = null,
        hasAudio = null,
        hasVideo = null;

  // 필터 복사 메서드
  RecordFilter copyWith({
    bool? hasImage,
    bool? hasAudio,
    bool? hasVideo,
  }) {
    return RecordFilter(
      hasImage: hasImage ?? this.hasImage,
      hasAudio: hasAudio ?? this.hasAudio,
      hasVideo: hasVideo ?? this.hasVideo,
    );
  }

  // 필터가 적용되었는지 확인
  bool get isFiltered =>
      hasImage != null || hasAudio != null || hasVideo != null;

  // URL 쿼리 파라미터로 변환
  Map<String, dynamic> toQueryParameters() {
    final params = <String, dynamic>{};
    if (hasImage != null) params['hasImage'] = hasImage;
    if (hasAudio != null) params['hasAudio'] = hasAudio;
    if (hasVideo != null) params['hasVideo'] = hasVideo;
    return params;
  }
}
