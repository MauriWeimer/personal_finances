import 'package:domain/domain.dart';

abstract class DatesRemoteDataSource {
  Future<List<Date>> getDates();
}