import '../../date/valueobjects/date.dart';
import '../valueobjects/category.dart';

class Expense {
  final Date date;
  final Category category;
  final double total;
  final String description;

  Expense({this.date, this.category, this.total, this.description});
}
