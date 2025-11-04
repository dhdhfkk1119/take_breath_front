import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/payment/providers/payment_notifier.dart';
import 'package:take_breath/domain/point/providers/point_notifier.dart';
import 'package:take_breath/presentation/pages/index_stack_page/mypage/payment_page/payment_webview_page.dart';

import '../../../../../domain/member/providers/member_login_notifier.dart';

class PointChargePage extends ConsumerStatefulWidget {
  const PointChargePage({super.key});

  @override
  ConsumerState<PointChargePage> createState() => _PointChargePageState();
}

class _PointChargePageState extends ConsumerState<PointChargePage> {
  int? _selectedAmount;
  bool _isProcessing = false;

  final List<Map<String, dynamic>> chargeOptions = [
    {'amount': 5000, 'label': '5,000P', 'price': '5,500원'},
    {'amount': 10000, 'label': '10,000P', 'price': '11,000원'},
    {'amount': 30000, 'label': '30,000P', 'price': '33,000원'},
    {'amount': 50000, 'label': '50,000P', 'price': '55,000원'},
  ];

  Future<void> _processPayment() async {
    if (_selectedAmount == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('충전 금액을 선택해주세요!')),
      );
      return;
    }

    setState(() => _isProcessing = true);

    try {
      final member = ref.read(memberProvider);
      debugPrint('저장된 사용자 정보: $member');
      if (member == null) {
        throw Exception('로그인이 필요합니다');
      }

      final prepareData = await ref.read(paymentProvider.notifier).prepare(
        amount: _selectedAmount!,
        orderName: '포인트 충전 $_selectedAmount P',
        buyerName: member.nickName,
        buyerEmail: member.email,
        buyerTel: '010-0000-0000',
      );

      if (!mounted) return;

      final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PaymentWebviewPage(prepareData: prepareData),
        ),
      );

      // 결제 완료 후 포인트 새로고침
      if (result == true && mounted) {
        // 포인트 재조회
        ref.read(pointProvider.notifier).refreshPoints();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('포인트 충전이 완료되었습니다!'),
            backgroundColor: Colors.teal,
          ),
        );

        Navigator.pop(context);
      }
    } catch (e) {
      setState(() => _isProcessing = false);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('결제 준비 실패: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final pointState = ref.watch(pointProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('포인트 충전'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.teal.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '현재 보유 포인트',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      '${pointState.totalPoints}P',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                '충전 금액 선택',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.2,
                ),
                itemCount: chargeOptions.length,
                itemBuilder: (context, index) {
                  final option = chargeOptions[index];
                  final isSelected = _selectedAmount == option['amount'];

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedAmount = option['amount'];
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.teal.withOpacity(0.1)
                            : Colors.white,
                        border: Border.all(
                          color: isSelected ? Colors.teal : Colors.grey[300]!,
                          width: isSelected ? 2 : 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            option['label'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.teal : Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            option['price'],
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '⚠ 유의사항',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '• 수수료 10%가 포함된 금액입니다.\n• 충전된 포인트는 환불되지 않습니다.\n• 포인트는 1년 후 자동 소멸됩니다.',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey[700],
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _isProcessing ? null : _processPayment,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    disabledBackgroundColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _isProcessing
                      ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor:
                      AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                      : const Text(
                    '결제하기',
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