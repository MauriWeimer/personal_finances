import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';

import '../dto/date_dto.dart';

class DatesRepositoryImpl implements DatesRepository {
  final FirebaseFirestore _firebaseFirestore;

  DatesRepositoryImpl(this._firebaseFirestore);

  @override
  Future<List<Date>> getDates() => _firebaseFirestore
          .collection('expenses')
          .orderBy('year', descending: true)
          .orderBy('month', descending: true)
          .limit(1)
          .get()
          .then(
        (snapshot) {
          final firstDate = DateDto.fromFirestore(snapshot).toDomain();
          final now = DateTime.now();

          var nextDate = Date(
            year: firstDate.year + ((firstDate.month + 1 == 12) ? 1 : 0),
            month: firstDate.month + 1,
          );
          final dates = [nextDate];

          while (nextDate.year != now.year && nextDate.month != now.month) {
            dates.add(nextDate);
            nextDate = Date(
              year: nextDate.year + ((nextDate.month + 1 == 12) ? 1 : 0),
              month: nextDate.month + 1,
            );
          }

          return dates;
        },
      );
}
