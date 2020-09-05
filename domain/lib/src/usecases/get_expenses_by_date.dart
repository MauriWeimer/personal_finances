import 'package:domain/src/entities/expenses/expense_entity.dart';

import '../entities/expenses/expenses_entity.dart';
import '../repositories/expense_repository.dart';
import '../values/date.dart';

export '../entities/expenses/expenses_entity.dart';
export '../repositories/expense_repository.dart';
export '../values/date.dart';

class GetExpensesByDate {
  // final ExpenseRepository _expenseRepository;

  // GetExpensesByDate(this._expenseRepository);

  // Stream<ExpensesEntity> execute(Date date) =>
  //     _expenseRepository.getByDate(date);

  Stream<ExpensesEntity> execute(Date date) async* {
    await Future.delayed(Duration(seconds: 2));

    yield ExpensesEntity(
      date: Date(year: 2020, month: 08, day: 01),
      expenses: [
        ExpenseEntity(
          total: 2583,
          description: 'ggggg',
          date: Date(year: 2020, month: 08, day: 01),
        ),
        ExpenseEntity(
          total: 23232,
          description: 'wwwwww',
          date: Date(year: 2020, month: 08, day: 01),
        ),
        ExpenseEntity(
          total: 555,
          description: 'Desc22222',
          date: Date(year: 2020, month: 08, day: 04),
        ),
        ExpenseEntity(
          total: 11,
          description: 'Desc444',
          date: Date(year: 2020, month: 08, day: 05),
        ),
        ExpenseEntity(
          total: 888,
          description: 'Desc3333',
          date: Date(year: 2020, month: 08, day: 05),
        ),
        ExpenseEntity(
          total: 234234,
          description: 'Descgggg',
          date: Date(year: 2020, month: 08, day: 07),
        ),
      ],
    );
  }
}
