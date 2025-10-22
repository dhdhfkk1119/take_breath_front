class RecordItem {
  final int id;
  String title;
  String content;
  final String date;
  int imageCount;
  int audioCount;

  RecordItem({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
    required this.imageCount,
    required this.audioCount,
  });

  // 기록 수정 메서드
  void update({
    required String title,
    required String content,
    required int imageCount,
    required int audioCount,
  }) {
    this.title = title;
    this.content = content;
    this.imageCount = imageCount;
    this.audioCount = audioCount;
  }

  // 기록 복사 메서드 (새로운 인스턴스 생성)
  RecordItem copyWith({
    int? id,
    String? title,
    String? content,
    String? date,
    int? imageCount,
    int? audioCount,
  }) {
    return RecordItem(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      date: date ?? this.date,
      imageCount: imageCount ?? this.imageCount,
      audioCount: audioCount ?? this.audioCount,
    );
  }
}
