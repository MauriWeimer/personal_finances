import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';

import './expenses_remote_data_source.dart';
import '../../mapping/expenses_mapper.dart';

class ExpensesFirestoreDataSource implements ExpensesRemoteDataSource {
  final FirebaseFirestore _firebaseFirestore;

  const ExpensesFirestoreDataSource(this._firebaseFirestore);

  @override
  Stream<Expenses> getByDate(Date date, List<Category> categories) =>
      _firebaseFirestore
          .collection('expenses')
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
}
