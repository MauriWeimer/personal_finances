import 'package:domain/domain.dart';

class HomeState {
  final double totalExpenses;
  final Map<String, double> statistics;
  final Map<Date, List<Expense>> perDay;

  const HomeState({
    this.totalExpenses,
    this.statistics,
    this.perDay,
  });
}
