import '../../categories/entities/category.dart';

class Expense {
  final DateTime date;
  final Category category;
  final double value;
  final String description;

  Expense({this.date, this.category, this.value, this.description});  
}
