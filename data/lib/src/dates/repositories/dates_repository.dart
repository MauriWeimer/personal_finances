import 'package:domain/domain.dart';

import '../datasources/date_data_source.dart';

class DatesRepositoryImpl implements DatesRepository {
  final DateDataSource _dateDataSource;

  const DatesRepositoryImpl(this._dateDataSource);

  @override
  Future<List<Date>> getDates() => _dateDataSource.getDates();
}
