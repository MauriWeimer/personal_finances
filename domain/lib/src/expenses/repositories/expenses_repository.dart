import '../entities/expenses.dart';
import '../../dates/valueobjects/date.dart';

abstract class ExpensesRepository {
  Stream<Expenses> getByDate(Date date);
}