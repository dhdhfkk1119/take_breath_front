import 'package:flutter/material.dart';
import 'package:take_breath/_core/constants/custom_color.dart';
import 'package:take_breath/presentation/pages/auth/sign/counselor_sign/counselor_sign_page.dart';
import 'package:take_breath/presentation/pages/auth/sign/member_sign/member_sign_page.dart';

class UserTypeSelected extends StatelessWidget {
  const UserTypeSelected({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "회원 유형을 선택해 주세요",
        style: TextStyle(color: brandBackColor, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.transparent,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context); // 팝업 닫기
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CounselorSignPage()),
              );
            },
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Image.asset(
                    "assets/counselor.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context); // 팝업 닫기
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MemberSignPage(),
                ),
              );
            },
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Image.asset(
                    "assets/basic.png", // 이미지 경로
                    fit: BoxFit.contain, // 이미지 전체가 잘리지 않고 보이도록 설정
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        OutlinedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: brandBackColor,
            foregroundColor: Colors.white,
          ),
          child: Text("취소"),
        ),
      ],
    );
  }
}
