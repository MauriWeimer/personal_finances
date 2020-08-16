import 'package:presentation_core/ploc.dart';

class HomeState extends PlocState {
  final double totalExpenses;
  final Map<String, double> expenseStatistics;
  final Map<String, List<double>> expenseValues;

  const HomeState({
    this.totalExpenses,
    this.expenseStatistics,
    this.expenseValues,
  });
}
