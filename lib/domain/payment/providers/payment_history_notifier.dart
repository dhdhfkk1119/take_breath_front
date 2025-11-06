import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/payment/models/payment_model.dart';
import 'package:take_breath/domain/payment/providers/payment_repository_provider.dart';
import 'package:take_breath/domain/payment/repositories/payment_repository.dart';

final paymentHistoryProvider =
AsyncNotifierProvider<PaymentHistoryNotifier, List<PaymentHistory>>(
    PaymentHistoryNotifier.new);

class PaymentHistoryNotifier extends AsyncNotifier<List<PaymentHistory>> {
  late final PaymentRepository paymentRepository;
  int _currentPage = 0;
  bool _hasMore = true;

  @override
  Future<List<PaymentHistory>> build() async {
    paymentRepository = ref.read(paymentRepositoryProvider);
    return _loadPayments();
  }

  // 초기 로드
  Future<List<PaymentHistory>> _loadPayments() async {
    _currentPage = 0;
    _hasMore = true;
    final payments = await paymentRepository.getPaymentHistory(
      page: _currentPage,
      size: 10,
    );

    if (payments.length < 10) {
      _hasMore = false;
    }

    return payments;
  }

  // 새로고침
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadPayments());
  }

  // 무한 스크롤 - 추가 로드
  Future<void> loadMore() async {
    if (!_hasMore || state.isLoading) return;

    final currentList = state.value ?? [];
    _currentPage++;

    try {
      final newPayments = await paymentRepository.getPaymentHistory(
        page: _currentPage,
        size: 10,
      );

      if (newPayments.isEmpty) {
        _hasMore = false;
      } else {
        state = AsyncValue.data([...currentList, ...newPayments]);
      }
    } catch (e, st) {
      _currentPage--; // 실패 시 페이지 롤백
      state = AsyncValue.error(e, st);
    }
  }

  // 환불 요청
  Future<void> requestRefund(int paymentId, String reason) async {
    try {
      await paymentRepository.requestRefund(
        paymentId: paymentId,
        reason: reason,
      );
      // 환불 후 새로고침
      await refresh();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  bool get hasMore => _hasMore;
}