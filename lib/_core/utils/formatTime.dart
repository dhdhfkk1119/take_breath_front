import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class FormatTime {
  static String beforeFormat(String dateTimeString) {
    final parsedDate = DateTime.parse(dateTimeString);
    return timeago.format(parsedDate, locale: 'ko');
  }

  static String createFormat(String dateTimeString) {
    final parsedDate = DateTime.parse(dateTimeString);
    final formatter = DateFormat('yyyy년 MM월 dd일 HH시 mm분', 'ko');
    return formatter.format(parsedDate);
  }
}
