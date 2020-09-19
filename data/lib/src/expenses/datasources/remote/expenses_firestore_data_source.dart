import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';

import './expenses_remote_data_source.dart';
import '../../mapping/expenses_mapper.dart';

class ExpensesFirestoreDataSource implements ExpensesRemoteDataSource {
  static const _collection = 'expenses';

  final FirebaseFirestore _firebaseFirestore;

  const ExpensesFirestoreDataSource(this._firebaseFirestore);

  @override
  Stream<Expenses> getByDate(Date date, List<Category> categories) =>
      _firebaseFirestore
          .collection(_collection)
          .where('year', isEqualTo: date.year)
          .where('month', isEqualTo: date.month)
          .orderBy('day', descending: true)
          .snapshots()
          .map(
            (snapshot) => ExpensesMapper.expensesFromFirestore(
              snapshot,
              categories,
            ),
          );

  @override
  Future<bool> addExpense(Expense expense) => _firebaseFirestore
      .collection(_collection)
      .add(ExpensesMapper.expenseToModel(expense).toMap())
      .then((_) => true);
}
