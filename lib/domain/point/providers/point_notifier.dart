import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/point_model.dart';

class PointNotifier extends StateNotifier<PointState> {
  PointNotifier() : super(PointState.initial()) {
    _loadPoints();
  }

  void _loadPoints() {
    // 테스트 데이터
    final testTransactions = [
      PointTransaction(
        id: 1,
        amount: 5000,
        type: 'charge',
        dateTime: DateTime(2024, 1, 15, 10, 30),
        description: '포인트 충전',
      ),
      PointTransaction(
        id: 2,
        amount: 1000,
        type: 'use',
        dateTime: DateTime(2024, 1, 14, 14, 20),
        description: '상담 예약',
      ),
      PointTransaction(
        id: 3,
        amount: 10000,
        type: 'charge',
        dateTime: DateTime(2024, 1, 13, 9, 0),
        description: '포인트 충전',
      ),
    ];

    // 총 포인트 계산
    int totalPoints = 0;
    for (var transaction in testTransactions) {
      if (transaction.type == 'charge') {
        totalPoints += transaction.amount;
      } else {
        totalPoints -= transaction.amount;
      }
    }

    state = state.copyWith(
      totalPoints: totalPoints,
      transactions: testTransactions,
    );
  }

  // 포인트 충전
  Future<void> chargePoints(int amount) async {
    state = state.copyWith(isLoading: true);
    try {
      await Future.delayed(const Duration(milliseconds: 800));
      // 결제 시뮬레이션

      final newTransaction = PointTransaction(
        id: state.transactions.length + 1,
        amount: amount,
        type: 'charge',
        dateTime: DateTime.now(),
        description: '포인트 충전',
      );

      final updatedTransactions = [newTransaction, ...state.transactions];
      final updatedPoints = state.totalPoints + amount;

      state = state.copyWith(
        totalPoints: updatedPoints,
        transactions: updatedTransactions,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        error: e.toString(),
        isLoading: false,
      );
    }
  }

  // 포인트 사용
  void usePoints(int amount, String description) {
    if (amount > state.totalPoints) {
      state = state.copyWith(
        error: '포인트가 부족합니다!',
      );
      return;
    }

    final newTransaction = PointTransaction(
      id: state.transactions.length + 1,
      amount: amount,
      type: 'use',
      dateTime: DateTime.now(),
      description: description,
    );

    final updatedTransactions = [newTransaction, ...state.transactions];
    final updatedPoints = state.totalPoints - amount;

    state = state.copyWith(
      totalPoints: updatedPoints,
      transactions: updatedTransactions,
    );
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

// Riverpod Provider
final pointProvider = StateNotifierProvider<PointNotifier, PointState>((ref) {
  return PointNotifier();
});
