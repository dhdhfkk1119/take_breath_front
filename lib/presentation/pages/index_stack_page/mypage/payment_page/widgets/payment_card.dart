import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:take_breath/domain/payment/models/payment_model.dart';
import 'package:take_breath/domain/payment/providers/payment_history_notifier.dart';
import 'package:take_breath/presentation/pages/index_stack_page/mypage/payment_page/widgets/payment_info.dart';

class PaymentCard extends ConsumerWidget {
  final PaymentHistory payment;

  const PaymentCard({
    super.key,
    required this.payment,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRefunded = payment.refundId != null;
    final formatter = NumberFormat('#,###');

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 상태 배지
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isRefunded ? Colors.grey : Colors.teal,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    isRefunded ? '환불 완료' : '결제 완료',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // const Spacer(),
                // Text(
                //   payment.paidAt ?? payment.createdAt,
                //   style: const TextStyle(
                //     fontSize: 12,
                //     color: Colors.grey,
                //   ),
                // ),
              ],
            ),
            const SizedBox(height: 12),

            // 결제 정보
            if (!isRefunded) ...[
              PaymentInfo(
                label: '주문명  ',
                value: payment.orderName,
              ),
              PaymentInfo(
                label: '결제수단  ',
                value: _getPayMethodName(payment.payMethod),
              ),
              PaymentInfo(
                label: '결제금액  ',
                value: '${formatter.format(payment.amount)} 원',
              ),
              PaymentInfo(
                label: '전환포인트  ',
                value: '${formatter.format(payment.pointAmount)} P',
                valueColor: Colors.teal,
              ),

              // 환불 가능 기간
              if (payment.canRefund) ...[
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.orange[50],
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.orange[200]!),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.access_time, size: 16, color: Colors.orange[700]),
                      const SizedBox(width: 8),
                      Text(
                        '환불 가능 기간  :  D-${payment.daysUntilRefundExpiry}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.orange[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              // 환불 버튼
              if (payment.canRefund) ...[
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => _showRefundDialog(context, ref),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red,
                      side: const BorderSide(color: Colors.red),
                    ),
                    child: const Text('환불 요청  '),
                  ),
                ),
              ],
            ] else ...[
              // 환불 정보
              PaymentInfo(
                label: '주문명  ',
                value: payment.orderName,
              ),
              PaymentInfo(
                label: '결제수단  ',
                value: _getPayMethodName(payment.payMethod),
              ),
              PaymentInfo(
                label: '환불금액  ',
                value: '${formatter.format(payment.refundAmount)} 원',
                valueColor: Colors.red,
              ),
              PaymentInfo(
                label: '환불포인트  ',
                value: '${formatter.format(payment.pointAmount)} P',
                valueColor: Colors.red,
              ),
              PaymentInfo(
                label: '결제시간  ',
                value: payment.paidAt ?? '',
              ),
              PaymentInfo(
                label: '환불시간  ',
                value: payment.refundedAt ?? '',
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _getPayMethodName(String method) {
    switch (method) {
      case 'card':
        return '신용카드';
      case 'kakaopay':
        return '카카오페이';
      case 'tosspay':
        return '토스페이';
      case 'naverpay':
        return '네이버페이';
      default:
        return method;
    }
  }

  void _showRefundDialog(BuildContext context, WidgetRef ref) {
    final formatter = NumberFormat('#,###');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('환불 확인'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('환불 금액  : ${formatter.format(payment.amount)}원'),
            Text('차감 포인트  : ${formatter.format(payment.pointAmount)}P'),
            const SizedBox(height: 8),
            const Text(
              '환불을 진행하시겠습니까?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('취소'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);

              try {
                await ref
                    .read(paymentHistoryProvider.notifier)
                    .requestRefund(payment.id, '사용자 요청');

                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('환불이 완료되었습니다')),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('환불 실패: $e')),
                  );
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('환불'),
          ),
        ],
      ),
    );
  }
}