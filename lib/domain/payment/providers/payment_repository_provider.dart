import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/utils/api_service.dart';
import 'package:take_breath/_core/utils/my_http.dart';
import 'package:take_breath/domain/payment/repositories/payment_repository.dart';

final paymentRepositoryProvider = Provider<PaymentRepository>((ref) {
  final apiService = ApiService(dio: dio);
  return PaymentRepository(apiService);
});