import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';

import '../models/date_model.dart';

class DateMapper {
  static Date dateFromFirestore(QuerySnapshot snapshot) => dateFromModel(
        dateModelFromMap(snapshot.docs.first.data()),
      );

  static Date dateFromModel(DateModel model) => Date(
        year: model.year,
        month: model.month,
        day: model.day,
      );
      
  static DateModel dateModelFromMap(Map<String, dynamic> map) => DateModel(
        year: map['year'],
        month: map['month'],
        day: map['day'],
      );

}
