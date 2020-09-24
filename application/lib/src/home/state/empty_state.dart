import 'package:domain/domain.dart';

import './home_state.dart';

class EmptyState implements HomeState {
  final List<DateTime> dates;
  final bool currentDate;

  const EmptyState({this.dates, this.currentDate});

  @override
  Result map<Result extends Object>(
    Result Function(SuccesState state) success, {
    Result Function() empty,
  }) {
    assert(success != null);
    assert(empty != null);

    return empty();
  }
}
