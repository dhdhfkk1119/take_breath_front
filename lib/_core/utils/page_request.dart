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
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    return PageResponse(
      content: (json['content'] as List)
          .map((e) => fromJsonT(e as Map<String, dynamic>))
          .toList(),
      pageNumber: json['pageNumber'],
      pageSize: json['pageSize'],
      totalPages: json['totalPages'],
      totalElements: json['totalElements'],
      isFirst: json['isFirst'],
      isLast: json['isLast'],
    );
  }
}
