class PageRequest {
  final int page;
  final int size;

  PageRequest({this.page = 0, this.size = 10});

  Map<String, dynamic> toQuery() => {
        "page": page,
        "size": size,
      };

  PageRequest next() => PageRequest(page: page + 1, size: size);
}

class PageResponse<T> {
  final List<T> content;
  final int pageNumber;
  final int pageSize;
  final int totalPages;
  final int totalElements;
  final bool isFirst;
  final bool isLast;

  PageResponse({
    required this.content,
    required this.pageNumber,
    required this.pageSize,
    required this.totalPages,
    required this.totalElements,
    required this.isFirst,
    required this.isLast,
  });

  factory PageResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return PageResponse<T>(
      content: (json['content'] as List<dynamic>)
          .map((e) => fromJsonT(e as Map<String, dynamic>))
          .toList(),
      pageNumber: json['number'] ?? 0, // <- Spring Page JSON 기준
      pageSize: json['size'] ?? 10,
      totalPages: json['totalPages'] ?? 1,
      totalElements: json['totalElements'] ?? 0,
      isFirst: json['first'] ?? false,
      isLast: json['last'] ?? false,
    );
  }

  PageResponse<T> copyWith({
    List<T>? content,
    int? pageNumber,
    int? pageSize,
    int? totalPages,
    int? totalElements,
    bool? isFirst,
    bool? isLast,
  }) {
    return PageResponse<T>(
      content: content ?? this.content,
      pageNumber: pageNumber ?? this.pageNumber,
      pageSize: pageSize ?? this.pageSize,
      totalPages: totalPages ?? this.totalPages,
      totalElements: totalElements ?? this.totalElements,
      isFirst: isFirst ?? this.isFirst,
      isLast: isLast ?? this.isLast,
    );
  }
}
