import '../valueobjects/date.dart';

abstract class DatesRepository {
  Future<List<Date>> getDates();
}