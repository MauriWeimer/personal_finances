import 'package:domain/domain.dart';

import '../datasources/remote/expenses_remote_data_source.dart';
import '../../categories/datasources/local/categories_local_data_source.dart';

class ExpensesRepositoryImpl implements ExpensesRepository {
  final ExpensesRemoteDataSource _expensesRemoteDataSource;
  final CategoriesLocalDataSource _categoriesLocalDataSource;

  const ExpensesRepositoryImpl(
    this._expensesRemoteDataSource,
    this._categoriesLocalDataSource,
  );

  @override
  Stream<Expenses> getByDate(Date date) => _expensesRemoteDataSource.getByDate(
        date,
        _categoriesLocalDataSource.getCategories(),
      );

  @override
  Future<bool> addExpense(Expense expense) =>
      _expensesRemoteDataSource.addExpense(expense);
}
