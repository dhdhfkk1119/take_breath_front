import 'package:flutter/material.dart';
import 'package:take_breath/_core/constants/custom_color.dart';
import 'package:take_breath/_core/constants/custom_widget.dart';
import 'package:take_breath/presentation/pages/auth/terms/widgets/terms_item.dart';

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

  // 필수 항목 체크 여부 확인
  void _updateAllAgreed() {
    _isAllAgreed = _isServiceAgreed &&
        _isPrivacyAgreed &&
        _isThirdPartyAgreed &&
        _isMarketingAgreed;
  }

  void _toggleAll(bool? value) {
    setState(() {
      _isAllAgreed = value ?? false;
      _isServiceAgreed = _isAllAgreed;
      _isPrivacyAgreed = _isAllAgreed;
      _isThirdPartyAgreed = _isAllAgreed;
      _isMarketingAgreed = _isAllAgreed;
    });
  }

  // 개별 항목의 상태 변경 처리 로직
  void _toggleService(bool? value) {
    setState(() {
      _isServiceAgreed = value ?? false;
      _updateAllAgreed();
    });
  }

  void _togglePrivacy(bool? value) {
    setState(() {
      _isPrivacyAgreed = value ?? false;
      _updateAllAgreed();
    });
  }

  void _toggleTrade(bool? value) {
    setState(() {
      _isThirdPartyAgreed = value ?? false;
      _updateAllAgreed();
    });
  }

  void _toggleMarketing(bool? value) {
    setState(() {
      _isMarketingAgreed = value ?? false;
      _updateAllAgreed();
    });
  }

  // _TermsBodyState 클래스의 build 메서드 수정

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomWidget.buildTitle("약관동의가"),
          CustomWidget.buildTitle("필요한"),
          CustomWidget.buildTitle("페이지입니다"),
          const SizedBox(height: 20),

          // 2. 약관 목록 (스크롤 가능한 부분)
          // Expanded로 감싸서 남은 공간을 모두 차지하게 하고,
          // 이 안에서만 스크롤이 되도록 ListView를 사용합니다.
          Expanded(
            child: ListView(
              // ListView의 기본 Padding을 제거하여 꽉 차게 만듭니다.
              padding: EdgeInsets.zero,
              children: [
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
                TermsItem(
                  title: "서비스 이용약관 (필수)",
                  dialogTitle: "서비스 이용 약관",
                  dialogContent: "서비스 이용 약관의 상세 내용을 등록하세요.",
                  value: _isServiceAgreed,
                  onChanged: _toggleService,
                ),
                TermsItem(
                  title: "개인정보 수집 및 이용 (필수)",
                  dialogTitle: "개인정보 수집 및 이용 동의",
                  dialogContent: "개인정보 수집 및 이용 동의의 상세 내용을 등록하세요.",
                  value: _isPrivacyAgreed,
                  onChanged: _togglePrivacy,
                ),
                TermsItem(
                  title: "전자금융거래 이용약관 (필수)",
                  dialogTitle: "전자 금융 거래 약관 및 이용 동의",
                  dialogContent: "개인정보 수집 및 이용 동의의 상세 내용을 등록하세요.",
                  value: _isThirdPartyAgreed,
                  onChanged: _toggleTrade,
                ),
                TermsItem(
                  title: "마케팅 정보 메일 (선택)",
                  dialogTitle: "마케팅 정보 메일 약관 및 이용 동의",
                  dialogContent: "개인정보 수집 및 이용 동의의 상세 내용을 등록하세요.",
                  value: _isMarketingAgreed,
                  onChanged: _toggleMarketing,
                ),
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
            ),
          ),

          ElevatedButton(
            onPressed:
                (_isServiceAgreed && _isPrivacyAgreed && _isThirdPartyAgreed)
                    ? () {
                        // 다음 페이지로 이동 로직
                      }
                    : null,
            child: const Text("다음"),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              backgroundColor: brandBackColor,
              foregroundColor: Colors.white,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom > 0 ? 10 : 0),
        ],
      ),
    );
  }
}
