class Date {
  final int year;
  final int month;
  final int day;

  Date({this.year, this.month, this.day});

  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Date &&
          (other.year == year) &&
          (other.month == month) &&
          (other.day == day));

  int get daysInMonth =>
      DateTime(year, month + 1).difference(DateTime(year, month, 1)).inDays;

  @override
  int get hashCode => year.hashCode ^ month.hashCode ^ day.hashCode;
}
