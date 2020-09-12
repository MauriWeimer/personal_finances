import '../repositories/dates_repository.dart';
import '../valueobjects/date.dart';

class GetAllDates {
  final DatesRepository _datesRepository;

  GetAllDates(this._datesRepository);

  Future<List<Date>> execute() => _datesRepository.getDates();
}
