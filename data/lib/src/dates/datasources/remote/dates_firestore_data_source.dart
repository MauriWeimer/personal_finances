import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';

import './dates_remote_data_source.dart';
import '../../mapping/dates_mapper.dart';

class DatesFirestoreDataSource implements DatesRemoteDataSource {
  final FirebaseFirestore _firebaseFirestore;

  const DatesFirestoreDataSource(this._firebaseFirestore);

  @override
  Future<List<Date>> getDates() => _firebaseFirestore
          .collection('expenses')
          .orderBy('year')
          .orderBy('month')
          .limit(1)
          .get()
          .then(
        (snapshot) {
          final firstDate = DatesMapper.dateFromFirestore(snapshot);
          final now = DateTime.now();

          var nextDate = Date(year: firstDate.year, month: firstDate.month);
          final dates = [nextDate];

          while (nextDate.year != now.year || nextDate.month != now.month) {
            final nextMonth = nextDate.month + 1;
            nextDate = Date(
              year: nextDate.year + ((nextMonth == 12) ? 1 : 0),
              month: nextMonth,
            );

            dates.add(nextDate);
          }

          return dates;
        },
      );
}