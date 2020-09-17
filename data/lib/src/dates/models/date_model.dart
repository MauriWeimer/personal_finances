class DateModel {
  final int year;
  final int month;
  final int day;

  const DateModel({
    this.year,
    this.month,
    this.day,
  });

  factory DateModel.fromMap(Map<String, dynamic> map) => DateModel(
        year: map['year'],
        month: map['month'],
        day: map['day'],
      );
}
