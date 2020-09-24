import '../valueobjects/expenses.dart';
import '../repositories/expenses_repository.dart';

class GetExpensesByDate {
  final ExpensesRepository _expensesRepository;

  const GetExpensesByDate(this._expensesRepository);

  Stream<Expenses> execute(DateTime date) =>
      _expensesRepository.getByDate(date);
}
