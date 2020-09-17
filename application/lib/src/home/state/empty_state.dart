import 'package:domain/domain.dart';

import './home_state.dart';

class EmptyState implements HomeState {
  const EmptyState();

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
