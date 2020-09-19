import '../../categories/models/category_model.dart';
import '../../dates/models/date_model.dart';

class ExpenseModel {
  final String category;
  final DateModel date;
  final double value;
  final String description;

  const ExpenseModel({
    this.category,
    this.date,
    this.value,
    this.description,
  });

  factory ExpenseModel.fromMap(Map<String, dynamic> map) => ExpenseModel(
        category: map['category'],
        date: DateModel(
          year: map['year'],
          month: map['month'],
          day: map['day'],
        ),
        value: (map['value'] as num).toDouble(),
        description: map['description'],
      );

  Map<String, dynamic> toMap() => {
        'category': category,
        'year': date.year,
        'month': date.month,
        'day': date.day,
        'value': value,
        'description': description,
      };
}
