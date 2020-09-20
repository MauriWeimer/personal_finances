import 'package:domain/domain.dart';

import './home_state.dart';

class SuccesState implements HomeState {
  final List<Date> dates;
  final double totalExpenses;
  final Map<String, double> statistics;
  final Map<Date, List<Expense>> perDay;

  const SuccesState({
    this.dates,
    this.totalExpenses,
    this.statistics,
    this.perDay,
  });

  @override
  Result map<Result extends Object>(
    Result Function(SuccesState state) success, {
    Result Function() empty,
  }) {
    assert(success != null);
    assert(empty != null);

    return success(this);
  }
}
