import 'package:flutter/material.dart';
import 'package:take_breath/_core/constants/custom_widget.dart';

class TermsBody extends StatefulWidget {
  const TermsBody({super.key});

  @override
  State<TermsBody> createState() => _TermsBodyState();
}

class _TermsBodyState extends State<TermsBody> {
  bool _isAllAgreed = false;
  bool _isServiceAgreed = false;
  bool _isPrivacyAgreed = false;
  bool _isThirdPartyAgreed = false;
  bool _isMarketingAgreed = false;

  void _toggleAll(bool? value) {
    setState(() {
      _isAllAgreed = value ?? false;
      _isServiceAgreed = _isAllAgreed;
      _isPrivacyAgreed = _isAllAgreed;
      _isThirdPartyAgreed = _isAllAgreed;
      _isMarketingAgreed = _isAllAgreed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          CustomWidget.buildTitle("약관동의가"),
          CustomWidget.buildTitle("필요한"),
          CustomWidget.buildTitle("페이지입니다"),
          const SizedBox(height: 20),
          CheckboxListTile(
            title: const Text(
              "전체 동의",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            value: _isAllAgreed,
            onChanged: _toggleAll,
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
          ),
          const Divider(),
          CheckboxListTile(
            title: const Text("서비스 이용약관 (필수)"),
            value: _isServiceAgreed,
            onChanged: (value) {
              setState(() {
                _isServiceAgreed = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading, // 체크박스 왼쪽
            contentPadding: EdgeInsets.zero,
            secondary: IconButton(
              icon: const Icon(Icons.keyboard_arrow_down),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("서비스 이용약관"),
                    content: const SingleChildScrollView(
                      child: Text(
                        "여기에 서비스 이용약관 내용을 표시합니다.\n"
                        "스크롤이 가능한 긴 텍스트를 넣어도 됩니다.",
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("닫기"),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
