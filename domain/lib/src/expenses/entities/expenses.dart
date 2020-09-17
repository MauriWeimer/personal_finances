import '../../dates/valueobjects/date.dart';
import './expense.dart';

class Expenses {
  final double total;
  final Map<Date, List<Expense>> perDay;
  final List<Expense> expenses;

  Expenses({this.expenses})
      : total = expenses.fold(
          0.0,
          (total, expense) => total + expense.value,
        ),
        perDay = expenses.fold({}, (perDay, expense) {
          if (!perDay.containsKey(expense.date))
            perDay[expense.date] = [expense];
          else
            perDay[expense.date].add(expense);

          return perDay;
        });

  Map<String, double> get statistics {
    final bars = 6;

    final daysInMonth = expenses.first.date.daysInMonth;
    final groupDays = daysInMonth ~/ bars;

    final statistics = <String, double>{};
    for (var i = 1; i <= bars; i++) {
      final firstDay = i * groupDays - groupDays + 1;
      final lastDay = (i == bars) ? daysInMonth : i * groupDays + 1;
      final key = firstDay.twoDigits + ' - ' + lastDay.twoDigits;

      statistics[key] = expenses
              .where((expense) =>
                  expense.date.day >= firstDay && expense.date.day <= lastDay)
              .fold(
                0,
                (total, expense) => total + expense.value,
              ) /
          total;
    }

    return statistics;
  }
}

//TODO: mover
extension on int {
  String get twoDigits =>
      '${(this < 10) ? this.toString().padLeft(2, '0') : this} ';
}
