import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String format(
    String pattern, {
    bool detectToday = false,
    bool detectYesterday = false,
  }) {
    if (detectToday || detectYesterday) {
      final now = DateTime.now();

      if (detectToday &&
          (this.year == now.year) &&
          (this.month == now.month) &&
          (this.day == now.day)) return 'Today';
      if (detectYesterday &&
          (this.year == now.year) &&
          (this.month == now.month) &&
          (this.day == now.day - 1)) return 'Yesterday';
    }

    return DateFormat(pattern).format(this);
  }
}
