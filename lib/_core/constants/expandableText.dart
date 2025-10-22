import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:take_breath/_core/constants/custom_color.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  double? size;
  final Color color;
  final int textLength;

  ExpandableText({
    super.key,
    required this.text,
    this.size,
    this.color = Colors.black45,
    required this.textLength,
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;
  late String firstPart;
  late String remainingPart;
  bool isOverflow = false;

  @override
  void initState() {
    super.initState();

    // 임시 로직: 텍스트 길이로 overflow 판단 (정확히는 TextPainter로 계산 가능)
    if (widget.text.length > widget.textLength) {
      isOverflow = true;
      firstPart = widget.text.substring(0, widget.textLength);
      remainingPart =
          widget.text.substring(widget.textLength, widget.text.length);
    } else {
      firstPart = widget.text;
      remainingPart = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: widget.size,
          color: widget.color,
          height: 1.4,
        ),
        children: [
          TextSpan(text: isExpanded ? widget.text : firstPart),
          if (isOverflow && !isExpanded)
            TextSpan(
              text: "... 자세히",
              style: TextStyle(
                color: brandFontColor,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  setState(() {
                    isExpanded = true;
                  });
                },
            ),
          if (isExpanded && isOverflow)
            TextSpan(
              text: "  접기",
              style: TextStyle(
                color: brandFontColor,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  setState(() {
                    isExpanded = false;
                  });
                },
            ),
        ],
      ),
    );
  }
}
