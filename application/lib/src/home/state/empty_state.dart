import 'package:domain/domain.dart';

import './home_state.dart';

class EmptyState implements HomeState {
  final List<Date> dates;

  const EmptyState({this.dates});

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
