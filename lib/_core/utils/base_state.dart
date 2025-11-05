class BaseState<T> {
  final bool isLoading;
  final String? error;
  final T? data;

  const BaseState({
    required this.isLoading,
    this.error,
    this.data,
  });

  factory BaseState.initial() => const BaseState(isLoading: false);

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
}
