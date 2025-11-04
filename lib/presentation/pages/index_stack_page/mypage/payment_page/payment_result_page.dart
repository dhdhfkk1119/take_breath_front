import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/payment/providers/payment_notifier.dart';
import 'package:take_breath/domain/point/providers/point_notifier.dart';

class PaymentResultPage extends ConsumerWidget {
  final bool success;
  final String? errorMsg;

  const PaymentResultPage({
    super.key,
    required this.success,
    this.errorMsg,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paymentState = ref.watch(paymentProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('결제 결과'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                success ? Icons.check_circle : Icons.error,
                size: 80,
                color: success ? Colors.teal : Colors.red,
              ),
              const SizedBox(height: 24),
              Text(
                success ? '결제 완료!' : '결제 실패',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: success ? Colors.teal : Colors.red,
                ),
              ),
              const SizedBox(height: 16),
              if (success && paymentState.hasValue && paymentState.value != null)
                Column(
                  children: [
                    Text(
                      '${paymentState.value!.pointAmount}P 충전 완료',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '결제금액: ${paymentState.value!.amount}원',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      '수수료: ${paymentState.value!.feeAmount}원',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              if (!success && errorMsg != null)
                Text(
                  errorMsg!,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    if (success) {
                      ref.invalidate(pointProvider);
                    }
                    ref.read(paymentProvider.notifier).reset();
                    Navigator.popUntil(context, ModalRoute.withName('/main'));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    '확인',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}