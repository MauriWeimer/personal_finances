import 'package:domain/domain.dart';

import '../datasources/remote/dates_remote_data_source.dart';

class DatesRepositoryImpl implements DatesRepository {
  final DatesRemoteDataSource _dateRemoteDataSource;

  const DatesRepositoryImpl(this._dateRemoteDataSource);

  @override
  Future<List<DateTime>> getDates() => _dateRemoteDataSource.getDates();
}
