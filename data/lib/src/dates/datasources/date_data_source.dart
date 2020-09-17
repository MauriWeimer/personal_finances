import 'package:domain/domain.dart';

abstract class DateDataSource {
  Future<List<Date>> getDates();
}