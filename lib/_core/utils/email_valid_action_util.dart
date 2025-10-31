class EmailValidationUtil {
  /// 이메일 형식의 유효성을 검사합니다.
  /// @와 도메인(.com, .net 등)을 포함하는 기본적인 형식을 확인합니다.
  static bool isValidEmail(String email) {
    // 간단하지만 일반적인 이메일 형식을 검사하는 정규표현식
    // (예: name@domain.com)
    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegExp.hasMatch(email);
  }
}
