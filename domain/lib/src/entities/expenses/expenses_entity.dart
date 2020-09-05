import '../../values/date.dart';
import './expense_entity.dart';

export './expense_entity.dart';

class ExpensesEntity {
  final Date date;
  final List<ExpenseEntity> expenses;

  ExpensesEntity({this.date, this.expenses});

  double get total => expenses.fold(
        0.0,
        (total, expense) => total + expense.total,
      );

  Map<String, double> get statistics => {
        '01-05': 0.4,
        '06-10': 0.1,
        '11-15': 0.2,
        '16-20': 0.6,
        '21-25': 0.0,
        '26-30': 0.2,
      };

  Map<Date, List<ExpenseEntity>> get perDay =>
      expenses.fold({}, (perDay, expense) {
        if (!perDay.containsKey(expense.date))
          perDay[expense.date] = [expense];
        else
          perDay[expense.date].add(expense);

        return perDay;
      });
}
