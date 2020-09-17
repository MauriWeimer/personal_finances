import 'package:domain/domain.dart';

import '../datasources/remote/expenses_remote_data_source.dart';

class ExpensesRepositoryImpl implements ExpensesRepository {
  final ExpensesRemoteDataSource _expensesRemoteDataSource;

  const ExpensesRepositoryImpl(this._expensesRemoteDataSource);

  @override
  Stream<Expenses> getByDate(Date date) =>
      _expensesRemoteDataSource.getByDate(date);
}
