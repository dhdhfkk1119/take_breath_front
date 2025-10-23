import 'package:flutter/material.dart';
import 'package:take_breath/_core/constants/custom_color.dart'; // brandBackColor를 임포트

// 닫기 가능한 정보 박스 위젯
class ClosableInfoBox extends StatefulWidget {
  String noticeTitle;
  String? title1;
  String? title2;
  String? title3;
  ClosableInfoBox(
      {super.key,
      required this.noticeTitle,
      this.title1,
      this.title2,
      this.title3});

  @override
  State<ClosableInfoBox> createState() => _ClosableInfoBoxState();
}

class _ClosableInfoBoxState extends State<ClosableInfoBox> {
  // 위젯 내부에서만 사용되는 상태 변수
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    if (!_isVisible) {
      return const SizedBox.shrink();
    }

    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            // brandBackColor 사용
            color: brandBackColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: brandBackColor, width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 8.0,
              right: 36.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.noticeTitle,
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                if (widget.title1?.isNotEmpty ?? false)
                  Text(
                    widget.title1!,
                    style: const TextStyle(color: Colors.redAccent),
                  ),
                if (widget.title2?.isNotEmpty ?? false)
                  Text(
                    widget.title2!,
                    style: const TextStyle(color: Colors.redAccent),
                  ),
                if (widget.title3?.isNotEmpty ?? false)
                  Text(
                    widget.title3!,
                    style: const TextStyle(color: Colors.redAccent),
                  ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isVisible = false; // 버튼 클릭 시 상태 변경
              });
            },
            child: Container(
              decoration: BoxDecoration(
                // brandBackColor 사용
                color: brandBackColor,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(2),
              child: const Icon(
                Icons.close,
                size: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
