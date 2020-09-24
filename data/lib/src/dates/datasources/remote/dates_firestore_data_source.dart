import 'package:cloud_firestore/cloud_firestore.dart';

import './dates_remote_data_source.dart';
import '../../mapping/dates_mapper.dart';

class DatesFirestoreDataSource implements DatesRemoteDataSource {
  final FirebaseFirestore _firebaseFirestore;

  const DatesFirestoreDataSource(this._firebaseFirestore);

  @override
  Future<List<DateTime>> getDates() => _firebaseFirestore
          .collection('expenses')
          .orderBy('year')
          .orderBy('month')
          .limit(1)
          .get()
          .then(
        (snapshot) {
          final firstDate = DatesMapper.dateFromFirestore(snapshot);
          final now = DateTime.now();

          var nextDate = DateTime(firstDate.year, firstDate.month);
          final dates = [nextDate];

          while (nextDate.year != now.year || nextDate.month != now.month) {
            final nextMonth = nextDate.month + 1;
            nextDate = DateTime(
              nextDate.year + ((nextMonth == 12) ? 1 : 0),
              nextMonth,
            );

            dates.add(nextDate);
          }

          return dates;
        },
      );
}
