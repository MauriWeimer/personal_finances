import 'package:domain/domain.dart';

abstract class ExpensesRemoteDataSource {
  Stream<Expenses> getByDate(Date date, List<Category> categories);
  Future<bool> addExpense(Expense expense);
}
