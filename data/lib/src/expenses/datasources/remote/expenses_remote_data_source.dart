import 'package:domain/domain.dart';

abstract class ExpensesRemoteDataSource {
  Stream<Expenses> getByDate(DateTime date, List<Category> categories);
  Future<bool> addExpense(Expense expense);
}
