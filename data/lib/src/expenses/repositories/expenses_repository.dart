import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';

import '../mapping/expenses_mapper.dart';

class ExpensesRepositoryImpl implements ExpensesRepository {
  final FirebaseFirestore _firebaseFirestore;

  ExpensesRepositoryImpl(this._firebaseFirestore);

  @override
  Stream<Expenses> getByDate(Date date) async* {
    yield* _firebaseFirestore
        .collection('expenses')
        .where('year', isEqualTo: date.year)
        .where('month', isEqualTo: date.month)
        .orderBy('day', descending: true)
        .snapshots()
        .map(
          (snapshot) => ExpensesMapper.expensesFromFirestore(snapshot),
        );
  }
}
