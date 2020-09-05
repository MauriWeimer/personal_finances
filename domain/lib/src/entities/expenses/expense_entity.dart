import '../../values/date.dart';
import '../../values/category.dart';

class ExpenseEntity {
  final Date date;
  final Category category;
  final double total;
  final String description;

  ExpenseEntity({this.date, this.category, this.total, this.description});
}
