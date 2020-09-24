import '../repositories/dates_repository.dart';

class GetAllDates {
  final DatesRepository _datesRepository;

  GetAllDates(this._datesRepository);

  Future<List<DateTime>> execute() => _datesRepository.getDates();
}
