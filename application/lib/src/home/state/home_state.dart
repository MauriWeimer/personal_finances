import 'package:domain/domain.dart';
import 'package:meta/meta.dart';

import './success_state.dart';
import './empty_state.dart';
export './success_state.dart';
export './empty_state.dart';

abstract class HomeState {
  final List<Date> dates;

  const factory HomeState({
    List<Date> dates,
    double totalExpenses,
    Map<String, double> statistics,
    Map<Date, List<Expense>> perDay,
  }) = SuccesState;
  const factory HomeState.empty({List<Date> dates}) = EmptyState;

  Result map<Result extends Object>(
    Result success(SuccesState state), {
    @required Result empty(),
  });
}
