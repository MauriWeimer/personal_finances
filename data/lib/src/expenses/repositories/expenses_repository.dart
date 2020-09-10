import 'package:domain/domain.dart';

class ExpensesRepositoryImpl implements ExpensesRepository {
  @override
  Stream<Expenses> getByDate(Date date) async* {
    await Future.delayed(Duration(seconds: 2));

    yield Expenses(
      date: Date(year: 2020, month: 08, day: 01),
      expenses: [
        Expense(
          total: 2583,
          description: 'ggggg',
          date: Date(year: 2020, month: 08, day: 01),
        ),
        Expense(
          total: 23232,
          description: 'wwwwww',
          date: Date(year: 2020, month: 08, day: 01),
        ),
        Expense(
          total: 555,
          description: 'Desc22222',
          date: Date(year: 2020, month: 08, day: 04),
        ),
        Expense(
          total: 11,
          description: 'Desc444',
          date: Date(year: 2020, month: 08, day: 05),
        ),
        Expense(
          total: 888,
          description: 'Desc3333',
          date: Date(year: 2020, month: 08, day: 05),
        ),
        Expense(
          total: 234234,
          description: 'Descgggg',
          date: Date(year: 2020, month: 08, day: 07),
        ),
      ],
    );
  }

}