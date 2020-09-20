import 'package:application_core/bloc.dart';
import 'package:domain/domain.dart';

import './state/home_state.dart';
export './state/home_state.dart';

class HomeBloc extends Bloc<HomeState> {
  final GetAllDates _getAllDates;
  final GetExpensesByDate _getExpensesByDate;

  HomeBloc(this._getAllDates, this._getExpensesByDate) {
    _getDates();
  }

  void _getDates() => execute<List<Date>>(
        useCase: Stream.fromFuture(_getAllDates.execute()),
        then: (dates) => emit(HomeState(dates: dates)),
      );

  void searchExpensesByDate(Date date) => execute<Expenses>(
        useCase: _getExpensesByDate.execute(date),
        then: (expenses) {
          if (expenses.expenses.isEmpty)
            emit(HomeState.empty(dates: state.dates));
          else
            emit(HomeState(
              dates: state.dates,
              totalExpenses: expenses.total,
              statistics: expenses.statistics,
              perDay: expenses.perDay,
            ));
        },
      );
}
