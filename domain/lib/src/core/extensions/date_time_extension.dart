extension DateTimeExtension on DateTime {
  int get daysInMonth => DateTime(year, month + 1)
      .difference(DateTime(this.year, this.month, 1))
      .inDays;
}
