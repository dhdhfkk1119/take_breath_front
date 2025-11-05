import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class FormatTime {
  static final DateFormat _serverInputParser =
  DateFormat('yyyy년 MM월 dd일 HH시 mm분', 'ko');

  static DateTime parseKoreanFormat(String dateTimeString) {
    try {
      return _serverInputParser.parse(dateTimeString);
    } catch (e) {
      print("날짜 파싱 오류 발생: $e - 입력값: $dateTimeString");
      return DateTime.now();
    }
  }

  static String beforeFormat(String dateTimeString) {
    final parsedDate = parseKoreanFormat(dateTimeString);
    return timeago.format(parsedDate, locale: 'ko');
  }

  static String createFormat(String dateTimeString) {
    final parsedDate = parseKoreanFormat(dateTimeString);
    final formatter = DateFormat('yyyy년 MM월 dd일 HH시 mm분', 'ko');
    return formatter.format(parsedDate);
  }
}
