import 'package:application_core/bloc.dart';
import 'package:domain/domain.dart';

import 'home_state.dart';
export 'home_state.dart';

class HomeBloc extends Bloc<HomeState> {
  final GetAllDates _getAllDates;
  final GetExpensesByDate _getExpensesByDate;

  HomeBloc(this._getAllDates, this._getExpensesByDate);

  Future<List<Date>> getDates() => _getAllDates.execute();

  void searchExpensesByDate(Date date) => execute<Expenses>(
        useCase: _getExpensesByDate.execute(Date(year: 2020, month: 9)),
        then: (expenses) => emit(HomeState(
          totalExpenses: expenses.total,
          statistics: expenses.statistics,
          perDay: expenses.perDay,
        )),
      );
}
