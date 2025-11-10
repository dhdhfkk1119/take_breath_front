import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hint;
  final bool obscureText;
  final TextEditingController controller; // 입력 받은 값을 가져올 수 있음
  final String? initValue; // 초기 값 - 글 쓰기
  final String? Function(String?)? validator; // 유효성 검사
  final InputDecoration? decoration;
  final ValueChanged<String>? onChanged;
  final bool enabled;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  double? size;

  CustomTextFormField({
    Key? key,
    this.hint,
    this.obscureText = false,
    required this.controller,
    this.initValue = "",
    this.validator,
    this.decoration,
    this.onChanged,
    this.enabled = true,
    this.inputFormatters,
    this.keyboardType, // 위젯 속성으로 키보드 타입 받기
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextInputType finalKeyboardType = keyboardType ?? TextInputType.text;

    if (initValue != null && initValue!.isNotEmpty) {
      controller.text = initValue!;
    }

    List<TextInputFormatter>? finalInputFormatters = inputFormatters;
    if (finalKeyboardType == TextInputType.number &&
        finalInputFormatters == null) {
      finalInputFormatters = [FilteringTextInputFormatter.digitsOnly];
    }

    final defaultDecoration = InputDecoration(
      hintText: hint != null ? "$hint" : null,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    );

    final mergedDecoration = (decoration ?? defaultDecoration).copyWith(
      border: decoration?.border ?? defaultDecoration.border,
      labelText: decoration?.labelText ?? defaultDecoration.labelText,
      hintText: decoration?.hintText ?? defaultDecoration.hintText,
      prefixIcon: decoration?.prefixIcon ?? defaultDecoration.prefixIcon,
      suffixIcon: decoration?.suffixIcon ?? defaultDecoration.suffixIcon,
      errorText:
          decoration?.errorText, // account_login_form.dart의 errorText를 사용하도록
    );

    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      decoration: mergedDecoration,
      onChanged: onChanged,
      enabled: enabled,
      inputFormatters: finalInputFormatters,
      keyboardType: finalKeyboardType,
      style: TextStyle(
        fontSize: size ?? 14,
      ),
    );
  }
}
