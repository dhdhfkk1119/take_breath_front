class BaseState<T> {
  final bool isLoading;
  final String? error;
  final T? data;

  const BaseState({
    required this.isLoading,
    this.error,
    this.data,
  });

  factory BaseState.initial() => BaseState<T>(
        isLoading: false,
        error: null,
        data: [] as T, // 리스트 타입이면 안전하게 처리
      );

  BaseState<T> copyWith({
    bool? isLoading,
    String? error,
    T? data,
  }) {
    return BaseState<T>(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      data: data ?? this.data,
    );
  }

  BaseState<T> loading() => copyWith(isLoading: true, error: null);
  BaseState<T> success(T data) => copyWith(isLoading: false, data: data);
  BaseState<T> failure(String error) =>
      copyWith(isLoading: false, error: error);
}
