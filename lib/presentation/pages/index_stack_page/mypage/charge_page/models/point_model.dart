import 'package:freezed_annotation/freezed_annotation.dart';

part 'point_model.freezed.dart';

@freezed
class PointTransaction with _$PointTransaction {
  const factory PointTransaction({
    required int id,
    required int amount,
    required String type, // 'charge' (충전), 'use' (사용)
    required DateTime dateTime,
    required String description,
  }) = _PointTransaction;
}

@freezed
class PointState with _$PointState {
  const factory PointState({
    required int totalPoints,
    required List<PointTransaction> transactions,
    required bool isLoading,
    required String? error,
  }) = _PointState;

  factory PointState.initial() => const PointState(
        totalPoints: 0,
        transactions: [],
        isLoading: false,
        error: null,
      );
}
