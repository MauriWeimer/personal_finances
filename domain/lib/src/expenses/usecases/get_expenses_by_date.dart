import '../../date/valueobjects/date.dart';
import '../entities/expenses.dart';
import '../repositories/expenses_repository.dart';

class GetExpensesByDate {
  final ExpensesRepository _expensesRepository;

  GetExpensesByDate(this._expensesRepository);

  Stream<Expenses> execute(Date date) => _expensesRepository.getByDate(date);
}
