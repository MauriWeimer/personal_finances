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
}
