import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class FormatTime {
  static DateTime parseServerFormat(String dateTimeString) {
    try {
      return DateTime.parse(dateTimeString);
    } catch (e) {
      print("날짜 파싱 오류 발생: $e - 입력값: $dateTimeString");
      return DateTime.now();
    }
  }

  static String beforeFormat(String dateTimeString) {
    final parsedDate = parseServerFormat(dateTimeString);
    return timeago.format(parsedDate, locale: 'ko');
  }

  static String createFormat(String dateTimeString) {
    final parsedDate = parseServerFormat(dateTimeString);
    final formatter = DateFormat('yyyy년 MM월 dd일 HH시 mm분', 'ko');
    return formatter.format(parsedDate);
  }
}