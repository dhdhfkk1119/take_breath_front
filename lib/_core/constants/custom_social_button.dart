import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:take_breath/_core/constants/custom_widget.dart'; // 기존 유틸리티 위젯 임포트

class CustomSocialButton extends StatelessWidget {
  String? logoUrl;
  String? logoName;
  final VoidCallback click;

  CustomSocialButton(
      {super.key, required this.click, this.logoUrl, this.logoName});

  @override
  Widget build(BuildContext context) {
    const Color googleBackgroundColor = Colors.white;
    const Color googleTextColor = Colors.black54;

    return Container(
      decoration: BoxDecoration(
        color: googleBackgroundColor,
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: Colors.grey.shade300, width: 1.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size(double.infinity, 50), // 최소 높이를 지정 (선택 사항)
        ),
        onPressed: click,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                logoUrl!,
                height: 20.0,
                width: 20.0,
              ),
              const SizedBox(width: 10.0),
              CustomWidget.buildTitle(
                logoName!,
                size: 16,
                weight: FontWeight.bold,
                color: googleTextColor, // 텍스트 색상을 검은색 계열로 변경
              ),
            ],
          ),
        ),
      ),
    );
  }
}
