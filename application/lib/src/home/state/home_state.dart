import 'package:domain/domain.dart';
import 'package:meta/meta.dart';

import './success_state.dart';
import './empty_state.dart';
export './success_state.dart';
export './empty_state.dart';

abstract class HomeState {
  final List<DateTime> dates;
  final bool currentDate;

  const factory HomeState({
    List<DateTime> dates,
    bool currentDate,
    double totalExpenses,
    Map<String, double> statistics,
    Map<DateTime, List<Expense>> perDay,
  }) = SuccesState;
  const factory HomeState.empty({
    List<DateTime> dates,
    bool currentDate,
  }) = EmptyState;

  Result map<Result extends Object>(
    Result success(SuccesState state), {
    @required Result empty(),
  });
}
