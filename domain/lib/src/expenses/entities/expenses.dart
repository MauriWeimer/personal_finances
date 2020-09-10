import '../valueobjects/date.dart';
import './expense.dart';

class Expenses {
  final Date date;
  final List<Expense> expenses;

  Expenses({this.date, this.expenses});

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

  Map<Date, List<Expense>> get perDay =>
      expenses.fold({}, (perDay, expense) {
        if (!perDay.containsKey(expense.date))
          perDay[expense.date] = [expense];
        else
          perDay[expense.date].add(expense);

        return perDay;
      });
}
