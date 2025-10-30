import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/constants/custom_color.dart';
import 'package:take_breath/_core/constants/custom_widget.dart';
import 'package:take_breath/domain/member/models/term.dart';
import 'package:take_breath/domain/member/models/terms_request.dart';
import 'package:take_breath/domain/member/providers/member_repository_provider.dart';
import 'package:take_breath/domain/member/providers/terms_notifier.dart';
import 'package:take_breath/presentation/pages/auth/terms/widgets/terms_item.dart';

class TermsBody extends ConsumerStatefulWidget {
  const TermsBody({super.key});

  @override
  ConsumerState<TermsBody> createState() => _TermsBodyState();
}

class _TermsBodyState extends ConsumerState<TermsBody> {
  Map<int, bool> _agreementStatus = {};

  bool _isAllAgreed = false;

  void _initializeAgreementStatus(List<Term> termsList) {
    if (_agreementStatus.isEmpty) {
      _agreementStatus = {for (var term in termsList) term.id: false};
    }
  }

  void _updateRequiredAgreed(List<Term> termsList) {
    final requiredTerms = termsList.where((term) => term.required);

    requiredTerms.every((term) => _agreementStatus[term.id] == true);

    final allAgreed =
        termsList.every((term) => _agreementStatus[term.id] == true);

    setState(() {
      _isAllAgreed = allAgreed;
    });
  }

  void _toggleAll(List<Term> termsList, bool? value) {
    final bool agreed = value ?? false;
    setState(() {
      _isAllAgreed = agreed;
      _agreementStatus = {for (var term in termsList) term.id: agreed};
    });
  }

  void _toggleAgreement(List<Term> termsList, int termsId, bool? value) {
    setState(() {
      _agreementStatus[termsId] = value ?? false;
      _updateRequiredAgreed(termsList);
    });
  }

  @override
  Widget build(BuildContext context) {
    final termsAsyncValue = ref.watch(termsProvider);
    bool canProceed = false;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomWidget.buildTitle("약관동의가"),
          CustomWidget.buildTitle("필요한"),
          CustomWidget.buildTitle("페이지입니다"),
          const SizedBox(height: 20),

          Expanded(
            child: termsAsyncValue.when(
              loading: () =>
                  const Center(child: CircularProgressIndicator()), // 로딩 중
              error: (e, st) => Center(child: Text("약관 로딩 실패: $e")), // 오류 발생
              data: (termsList) {
                _initializeAgreementStatus(termsList);

                canProceed = termsList
                    .where((term) => term.required)
                    .every((term) => _agreementStatus[term.id] == true);

                return ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    CheckboxListTile(
                      title: const Text(
                        "전체 동의",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      value: _isAllAgreed,
                      onChanged: (value) =>
                          _toggleAll(termsList, value), // 변경된 함수 호출
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                    ),
                    const Divider(),
                    ...termsList.map((term) {
                      return TermsItem(
                        title: "${term.title} (${term.required ? '필수' : '선택'})",
                        dialogTitle: term.title,
                        dialogContent: term.content,
                        value: _agreementStatus[term.id] ?? false,
                        onChanged: (value) =>
                            _toggleAgreement(termsList, term.id, value),
                      );
                    }).toList(),
                    const SizedBox(height: 40),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Container(
                        width: double.infinity,
                        height: 150,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/terms_back.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          // 다음 버튼 (활성화 조건 사용)
          ElevatedButton(
            onPressed: canProceed
                ? () {
                    final List<TermsRequest> agreements =
                        _agreementStatus.entries
                            .map((entry) => TermsRequest(
                                  termsId: entry.key, // 약관 ID
                                  agreed: entry.value, // 동의 여부
                                ))
                            .toList();
                    Navigator.pop(context, agreements);
                  }
                : null,
            child: const Text("다음"),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              backgroundColor:
                  canProceed ? brandBackColor : Colors.grey, // 활성화/비활성화 시 색상
              foregroundColor: Colors.white,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom > 0 ? 10 : 0),
        ],
      ),
    );
  }
}
