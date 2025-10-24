import 'package:flutter/material.dart';
import 'package:take_breath/_core/constants/custom_color.dart';

class UserTypeSelected extends StatelessWidget {
  // 상담사 선택 시 실행할 콜백 함수
  final VoidCallback onCounselorSelected;
  // 일반 유저 선택 시 실행할 콜백 함수
  final VoidCallback onUserSelected;

  const UserTypeSelected({
    super.key,
    required this.onCounselorSelected,
    required this.onUserSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "회원 유형을 선택해 주세요",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
              onUserSelected(); // 콜백 함수 실행
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
              onUserSelected(); // 콜백 함수 실행
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
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            "취소",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
