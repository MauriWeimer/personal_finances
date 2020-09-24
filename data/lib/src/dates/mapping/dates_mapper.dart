import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/date_model.dart';

class DatesMapper {
  static DateTime dateFromFirestore(QuerySnapshot snapshot) => dateFromModel(
        DateModel.fromMap(snapshot.docs.first.data()),
      );

  static DateTime dateFromModel(DateModel model) =>
      DateTime(model.year, model.month, model.day);

  static DateModel dateToModel(DateTime valueobject) => DateModel(
        year: valueobject.year,
        month: valueobject.month,
        day: valueobject.day,
      );
}
