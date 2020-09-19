import '../valueobjects/expenses.dart';
import '../../dates/valueobjects/date.dart';
import '../../expenses/entities/expense.dart';

abstract class ExpensesRepository {
  Stream<Expenses> getByDate(Date date);
  Future<bool> addExpense(Expense expense);
}
