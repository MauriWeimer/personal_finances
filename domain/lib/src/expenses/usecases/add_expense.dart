import '../repositories/expenses_repository.dart';
import '../../expenses/entities/expense.dart';

class AddExpense {
  final ExpensesRepository _expensesRepository;

  const AddExpense(this._expensesRepository);

  Future<bool> execute(Expense expense) =>
      _expensesRepository.addExpense(expense);
}
