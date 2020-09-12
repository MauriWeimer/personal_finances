import 'package:application_core/bloc.dart';
import 'package:domain/domain.dart';

import './state/home_state.dart';
export './state/home_state.dart';

class HomeBloc extends Bloc<HomeState> {
  final GetAllDates _getAllDates;
  final GetExpensesByDate _getExpensesByDate;

  HomeBloc(this._getAllDates, this._getExpensesByDate);

  Future<List<Date>> getDates() => _getAllDates.execute();

  void searchExpensesByDate(Date date) => execute<Expenses>(
        useCase: _getExpensesByDate.execute(date),
        then: (expenses) {
          if (expenses.expenses.isEmpty)
            emit(HomeState.empty());
          else
            emit(HomeState.success(
              totalExpenses: expenses.total,
              statistics: expenses.statistics,
              perDay: expenses.perDay,
            ));
        },
      );
}
