import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/payment/repositories/payment_repository.dart';

final paymentRepositoryProvider = Provider<PaymentRepository>((ref) {
  return PaymentRepository();
});