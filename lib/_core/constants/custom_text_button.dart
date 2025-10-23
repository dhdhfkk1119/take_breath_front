import 'package:flutter/material.dart';
import 'package:take_breath/_core/constants/custom_color.dart';
import 'package:take_breath/_core/constants/custom_widget.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback click;
  // 버튼 비활성화 추가하기 -> 연속 클릭으로 데이터 중복으로 들어가는 거 방지
  const CustomTextButton({super.key, required this.text, required this.click});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: brandBackColor, // Container의 배경색 (color 속성 대신 여기로 옮김)
        borderRadius: BorderRadius.circular(5.0), // 둥근 모서리 설정 (선택 사항)
      ),
      width: double.infinity,
      child: TextButton(
        onPressed: click,
        child: CustomWidget.buildTitle(
          text,
          size: 16,
          weight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
