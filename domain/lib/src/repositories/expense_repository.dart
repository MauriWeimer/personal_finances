import '../entities/expenses/expenses_entity.dart';
import '../values/date.dart';

abstract class ExpenseRepository {
  Stream<ExpensesEntity> getByDate(Date date);
}