import 'package:application_core/bloc.dart';
import 'package:domain/domain.dart';

import './add_expense_state.dart';
export './add_expense_state.dart';

class AddExpenseBloc extends Bloc<AddExpenseState> {
  final GetCategories _getCategories;
  final AddExpense _addExpense;

  AddExpenseBloc(this._getCategories, this._addExpense)
      : super(
          AddExpenseState(
            categories: _getCategories.execute(),
            value: 0,
            date: DateTime.now(),
            added: false,
          ),
        );

  void categoryIndex(int i) => emit(state.copyWith(
        currentCategory: state.categories[i],
      ));
  set description(String description) => emit(state.copyWith(
        description: description,
      ));

  void increment(int number) =>
      emit(state.copyWith(value: state.value * 10 + number));

  void decrement() => emit(state.copyWith(value: state.value ~/ 10));

  void addExpense() => execute<bool>(
        useCase: Stream.fromFuture(
          _addExpense.execute(
            Expense(
              date: state.date,
              category: state.currentCategory,
              value: state.value / 100,
              description: state.description,
            ),
          ),
        ),
        then: (result) => emit(state.copyWith(added: result)),
        emitLoading: false,
      );
}
