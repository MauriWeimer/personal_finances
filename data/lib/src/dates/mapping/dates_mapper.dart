import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';

import '../models/date_model.dart';

class DatesMapper {
  static Date dateFromFirestore(QuerySnapshot snapshot) => dateFromModel(
        DateModel.fromMap(snapshot.docs.first.data()),
      );

  static Date dateFromModel(DateModel model) => Date(
        year: model.year,
        month: model.month,
        day: model.day,
      );
}
