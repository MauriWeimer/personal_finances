import 'package:presentation_core/ploc.dart';

import 'home_state.dart';

export 'home_state.dart';

//TODO: sacar ...
class ExpenseModel {
  final double totalExpenses = 2423.25;
  final Map<String, double> expenseStatistics = {
    '01-05': 0.4,
    '06-10': 0.1,
    '11-15': 0.2,
    '16-20': 0.6,
    '21-25': 0.0,
    '26-30': 0.2,
  };
  final Map<String, List<double>> expenseValues = {
    'Today': [
      500,
      600,
    ],
    'Martes 24': [
      500,
      600,
      500,
      600,
      500,
      600,
    ],
  };
}

class HomePloc extends Ploc<HomeState> {
  Future<List<int>> getDates() async {
    return await Future.delayed(
      Duration(seconds: 3),
    ).then(
      (_) => [1, 2, 3, 4],
    );
  }

  void searchExpensesByDate(int date) {
    executeFuture<ExpenseModel>(
      useCase: Future.delayed(
        Duration(seconds: 3),
      ),
      andThen: (_) {
        final expense = ExpenseModel();

        emit(
          HomeState(
            totalExpenses: expense.totalExpenses,
            expenseStatistics: expense.expenseStatistics,
            expenseValues: expense.expenseValues,
          ),
        );
      },
    );
  }
}
