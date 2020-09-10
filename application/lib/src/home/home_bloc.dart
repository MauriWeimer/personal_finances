import 'package:application_core/bloc.dart';
import 'package:domain/domain.dart';

import 'home_state.dart';
export 'home_state.dart';

// //TODO: sacar ...
// class ExpenseModel {
//   final double totalExpenses = 2423.25;
//   final Map<String, double> expenseStatistics = {
//     '01-05': 0.4,
//     '06-10': 0.1,
//     '11-15': 0.2,
//     '16-20': 0.6,
//     '21-25': 0.0,
//     '26-30': 0.2,
//   };
//   final Map<String, List<double>> expenseValues = {
//     'Today': [
//       500,
//       600,
//     ],
//     'Martes 24': [
//       500,
//       600,
//       500,
//       600,
//       500,
//       600,
//     ],
//   };
// }

class HomeBloc extends Bloc<HomeState> {
  final GetExpensesByDate _getExpensesByDate;

  HomeBloc(this._getExpensesByDate);

  Future<List<int>> getDates() async {
    return await Future.delayed(
      Duration(seconds: 3),
    ).then(
      (_) => [1, 2, 3, 4],
    );
  }

  @override
  Future<void> close() {
    print('bloc disposed');

    return super.close();
  }

  void searchExpensesByDate(Date date) {

    //TODO: ver si es necesario SOLO USAR streams

    executeStream<Expenses>(
      useCase: _getExpensesByDate.execute(date),
      then: (expenses) => emit(HomeState(
        totalExpenses: expenses.total,
        statistics: expenses.statistics,
        perDay: expenses.perDay,
      )),
    );

    // executeFuture<ExpenseModel>(
    //   useCase: Future.delayed(
    //     Duration(seconds: 3),
    //   ),
    //   then: (_) {
    //     final expense = ExpenseModel();

    //     emit(
    //       HomeState(
    //         totalExpenses: expense.totalExpenses,
    //         expenseStatistics: expense.expenseStatistics,
    //         expenseValues: expense.expenseValues,
    //       ),
    //     );
    //   },
    // );
  }
}
