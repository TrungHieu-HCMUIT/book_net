import 'package:intl/intl.dart';

class TimeUtils {
  static const minute = 'm';
  static const hour = 'h';
  static const day = 'd';

  static const String yyyyMMdd = 'yyyy-MM-dd';
  static const String yyyMMdd_HHmm = 'yyyy-MM-dd HH:mm';

  static String getDurationText(int timeInEpoch) {
    String text = '';
    DateTime nowEpoch = DateTime.now();
    DateTime argEpoch = DateTime.fromMillisecondsSinceEpoch(timeInEpoch);

    int durationInYear = nowEpoch.year - argEpoch.year;
    int durationInMonth = nowEpoch.month - argEpoch.month;
    int durationInDay = nowEpoch.day - argEpoch.day;
    int durationInHour = nowEpoch.hour - argEpoch.hour;
    int durationInMinute = nowEpoch.minute - argEpoch.minute;

    if (durationInYear > 0 || durationInMonth > 0 || durationInDay > 7) {
      DateFormat format = DateFormat(yyyyMMdd);
      text = format.format(nowEpoch);
    } else if (durationInDay > 0) {
      text = "$durationInDay$day";
    } else if (durationInHour > 0) {
      text = "$durationInHour$hour";
    } else if (durationInMinute > 0) {
      text = "$durationInMinute$minute";
    } else {
      text = 'now';
    }

    return text;
  }

  static String getCurrentDateTime() {
    final DateTime nowEpoch = DateTime.now();
    final DateFormat formatter = DateFormat(yyyMMdd_HHmm);
    return formatter.format(nowEpoch);
  }
}
