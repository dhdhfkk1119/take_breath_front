import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/payment/models/payment_model.dart';
import 'package:take_breath/domain/payment/providers/payment_repository_provider.dart';
import 'package:take_breath/domain/payment/repositories/payment_repository.dart';


final paymentProvider =
AsyncNotifierProvider<PaymentNotifier, PaymentResult?>(PaymentNotifier.new);

class PaymentNotifier extends AsyncNotifier<PaymentResult?> {
  late final PaymentRepository paymentRepository;

  @override
  Future<PaymentResult?> build() async {
    paymentRepository = ref.read(paymentRepositoryProvider);
    return null;
  }

  Future<PaymentPrepare> prepare({
    required int amount,
    required String orderName,
    required String buyerName,
    required String buyerEmail,
    required String buyerTel,
  }) async {
    return await paymentRepository.prepare(
      amount: amount,
      orderName: orderName,
      buyerName: buyerName,
      buyerEmail: buyerEmail,
      buyerTel: buyerTel,
    );
  }

  Future<void> verify({
    required String impUid,
    required String merchantUid,
  }) async {
    state = const AsyncValue.loading();

    try {
      final result = await paymentRepository.verify(
        impUid: impUid,
        merchantUid: merchantUid,
      );
      state = AsyncValue.data(result);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void reset() {
    state = const AsyncValue.data(null);
  }
}