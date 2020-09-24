import '../valueobjects/expenses.dart';
import '../../expenses/entities/expense.dart';

abstract class ExpensesRepository {
  Stream<Expenses> getByDate(DateTime date);
  Future<bool> addExpense(Expense expense);
}
