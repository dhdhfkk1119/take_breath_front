import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portone_flutter/iamport_payment.dart';
import 'package:take_breath/domain/payment/models/payment_model.dart';
import 'package:take_breath/domain/payment/providers/payment_notifier.dart';
import 'package:take_breath/domain/payment/services/portone_service.dart';
import 'package:take_breath/presentation/pages/index_stack_page/mypage/payment_page/payment_result_page.dart';

class PaymentWebviewPage extends ConsumerStatefulWidget {
  final PaymentPrepare prepareData;

  const PaymentWebviewPage({
    super.key,
    required this.prepareData,
  });

  @override
  ConsumerState<PaymentWebviewPage> createState() => _PaymentWebviewPageState();
}

class _PaymentWebviewPageState extends ConsumerState<PaymentWebviewPage> {
  @override
  Widget build(BuildContext context) {
    return IamportPayment(
      appBar: AppBar(
        title: const Text('결제하기'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      /* 웹뷰 로딩 컴포넌트 */
      initialChild: Container(
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: Colors.teal),
              SizedBox(height: 16),
              Text('결제 정보를 불러오는 중...', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
      /* [필수입력] 가맹점 식별코드 */
      userCode: PortoneService.userCode,
      /* [필수입력] 결제 데이터 */
      data: PortoneService.createPayment(
        merchantUid: widget.prepareData.merchantUid,
        amount: widget.prepareData.amount,
        orderName: widget.prepareData.orderName,
        buyerName: widget.prepareData.buyerName,
        buyerEmail: widget.prepareData.buyerEmail,
        buyerTel: widget.prepareData.buyerTel,
      ),
      /* [필수입력] 콜백 함수 */
      callback: (Map<String, String> result) async {

        /// 디버깅 : 콜백 데이터 전체 출력
        print('=' * 60);
        print('결제 콜백 원본 데이터:');
        result.forEach((key, value) {
          print('  $key: $value');
        });
        print('=' * 60);

        final success = result['imp_success'] == 'true';
        final impUid = result['imp_uid'];
        final merchantUid = result['merchant_uid'];
        final errorMsg = result['error_msg'];

        print('결제 콜백 결과: $result');

        // 1. 결제 성공 시 서버 검증
        bool verifySuccess = false;
        if (success && impUid != null && merchantUid != null) {
          try {
            print('서버 검증 시작: impUid=$impUid, merchantUid=$merchantUid');

            await ref.read(paymentProvider.notifier).verify(
              impUid: impUid,
              merchantUid: merchantUid,
            );

            // 검증 결과 확인
            final paymentState = ref.read(paymentProvider);
            verifySuccess = paymentState.hasValue && paymentState.value != null;

            print('서버 검증 완료: success=$verifySuccess');
          } catch (e, st) {
            print('서버 검증 실패: $e');
            print('Stack trace: $st');
          }
        } else {
          print('결제 실패: success=$success, impUid=$impUid, merchantUid=$merchantUid');
          print('에러 메시지: $errorMsg');
        }

        // 2. 결과 페이지로 이동 (mounted 체크)
        if (!mounted) {
          print('Widget이 unmounted 상태입니다');
          return;
        }

        try {
          // WebView 페이지 닫기
          Navigator.of(context).pop();

          // 결과 페이지로 이동
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => PaymentResultPage(
                success: success && verifySuccess, // 결제 성공 + 검증 성공
                errorMsg: errorMsg,
              ),
            ),
          );
          Navigator.pushNamed(context,"/main");
          print('결과 페이지로 이동 완료');
        } catch (e) {
          print('페이지 이동 실패: $e');
        }
      },
    );
  }
}