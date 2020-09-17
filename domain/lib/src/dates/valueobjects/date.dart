class Date {
  final int year;
  final int month;
  final int day;

  Date({this.year, this.month, this.day});

  int get daysInMonth =>
      DateTime(year, month + 1).difference(DateTime(year, month, 1)).inDays;

  @override
  bool operator ==(dynamic other) =>
      identical(other, this) ||
      (other is Date &&
          (other.year == year) &&
          (other.month == month) &&
          (other.day == day));

  @override
  int get hashCode => year.hashCode ^ month.hashCode ^ day.hashCode;
}
