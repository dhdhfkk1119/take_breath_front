import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/point/providers/point_repository_provider.dart';
import '../models/point_model.dart';
import '../repositories/point_repository.dart';

class PointNotifier extends StateNotifier<PointState> {
  final PointRepository pointRepository;

  PointNotifier(this.pointRepository) : super(PointState.initial()) {
    refreshPoints();
  }

  // 포인트 조회
  Future<void> refreshPoints() async {
    state = state.copyWith(isLoading: true);

    try {
      final balance = await pointRepository.getBalance();
      final history = await pointRepository.getHistory();

      state = state.copyWith(
        totalPoints: balance,
        transactions: history,
        isLoading: false,
        error: null,
      );

      print('포인트 조회 성공: ${balance}P, 내역: ${history.length}건');
    } catch (e) {
      print('포인트 조회 실패: $e');
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

final pointProvider = StateNotifierProvider<PointNotifier, PointState>((ref) {
  final pointRepository = ref.read(pointRepositoryProvider);
  return PointNotifier(pointRepository);
});