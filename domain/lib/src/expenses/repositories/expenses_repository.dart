import '../entities/expenses.dart';
import '../valueobjects/date.dart';

abstract class ExpensesRepository {
  Stream<Expenses> getByDate(Date date);
}