import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/constants/custom_color.dart';
import 'package:take_breath/_core/constants/custom_social_button.dart';
import 'package:take_breath/_core/constants/custom_text_button.dart';
import 'package:take_breath/domain/member/providers/member_login_notifier.dart';
import 'package:take_breath/presentation/pages/auth/login/member_login/member_login_page.dart';
import 'package:take_breath/presentation/pages/auth/social/widgets/user_type_selected.dart';
import 'package:take_breath/presentation/pages/index_stack_page/main_screen.dart';

class SocialBody extends ConsumerWidget {
  const SocialBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 48.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: brandBackColor),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Image.asset(
                'assets/logo/logo.png',
                width: 120,
                height: 120,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "한숨 돌리고 가세요",
                style: TextStyle(
                    color: brandFontColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                // 랜덤으로 문구가 등장하게
                child: InkWell(
                  borderRadius: BorderRadius.circular(24.0),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainScreen(),
                      ),
                    );
                  },
                  onFocusChange: (value) {},
                  child: Center(
                    child: Icon(
                      Icons.keyboard_return,
                      color: brandFontColor,
                    ),
                  ),
                ),
              )
            ],
          ),
          Text(
            "여러분들의 고민 말하지 못한 것 비밀이야기를 ",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          Text(
            "모두에게 공유하고 편하게 털어놓을 수 있으시면 감사하겠습니다",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          Text(
            "용기를 내어 시작해주시기 바랍니다",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 180,
          ),
          // 소셜 로그인 버튼
          CustomSocialButton(
            logoName: "네이버 로그인 진행",
            logoUrl: 'assets/social/naver.svg',
            click: () async {
              final memberNotifier = ref.read(memberProvider.notifier);

              final member = ref.read(memberProvider);
              if (member != null) {
                Navigator.pushReplacementNamed(context, "/main");
              }
            },
          ),
          SizedBox(
            height: 16,
          ),
          // 소셜 로그인 버튼
          CustomSocialButton(
            logoName: "구글 로그인 진행",
            logoUrl: 'assets/social/google.svg',
            click: () async {
              final memberNotifier = ref.read(memberProvider.notifier);
              await memberNotifier.socialLoginUser(context);

              final member = ref.read(memberProvider);
              if (member != null) {
                Navigator.pushReplacementNamed(context, "/main");
              }
            },
          ),

          SizedBox(
            height: 8,
          ),
          CustomTextButton(
            text: "시작하기",
            icon: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
            click: () {
              showDialog(
                context: context,
                builder: (BuildContext dialogContext) {
                  return UserTypeSelected();
                },
              );
            },
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "이미 계정이 있으신가요? ",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MemberLoginPage()));
                },
                child: Text(
                  "로그인",
                  style: TextStyle(
                    color: brandFontColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
