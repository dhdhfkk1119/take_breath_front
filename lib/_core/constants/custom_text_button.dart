import 'package:flutter/material.dart';
import 'package:take_breath/_core/constants/custom_widget.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback click;
  final Widget? icon;
  final double? height;

  const CustomTextButton({
    super.key,
    required this.text,
    required this.click,
    this.icon,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    const Color brandBackColor = Colors.blue;

    return Container(
      height: height ?? 50,
      decoration: BoxDecoration(
        color: brandBackColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      width: double.infinity,
      child: TextButton(
        onPressed: click,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
          mainAxisSize: MainAxisSize.min, // Row의 크기를 내부 컨텐츠에 맞춥니다.
          children: [
            CustomWidget.buildTitle(
              text,
              size: 16,
              weight: FontWeight.bold,
              color: Colors.white,
            ),
            if (icon != null) ...[
              const SizedBox(width: 8.0), // 아이콘과 텍스트 사이에 간격 추가
              icon!, // 아이콘 위젯
            ],
          ],
        ),
      ),
    );
  }
}
