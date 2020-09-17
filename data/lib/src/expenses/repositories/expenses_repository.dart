import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';

import '../mapping/expenses_mapper.dart';
import '../datasources/expenses_data_source.dart';

class ExpensesRepositoryImpl implements ExpensesRepository {
  final ExpensesDataSource _expensesDataSource;

  const ExpensesRepositoryImpl(this._expensesDataSource);

  @override
  Stream<Expenses> getByDate(Date date) => _expensesDataSource.getByDate(date);
}
