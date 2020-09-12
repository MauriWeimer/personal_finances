import '../entities/expenses.dart';
import '../../date/valueobjects/date.dart';

abstract class ExpensesRepository {
  Stream<Expenses> getByDate(Date date);
}