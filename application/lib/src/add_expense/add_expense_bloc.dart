import 'package:application_core/bloc.dart';
import 'package:domain/domain.dart';

import './add_expense_state.dart';
export './add_expense_state.dart';

class AddExpenseBloc extends Bloc<AddExpenseState> {
  final GetCategories _getCategories;
  final AddExpense _addExpense;
  Category _currentCategory;
  String _description;

  AddExpenseBloc(this._getCategories, this._addExpense)
      : super(
          AddExpenseState(
            value: 0,
            date: Date(
              year: DateTime.now().year,
              month: DateTime.now().month,
              day: DateTime.now().day,
            ),
            added: false,
          ),
        );

  List<Category> getCategories() => _getCategories.execute();

  set category(Category category) => _currentCategory = category;
  set description(String description) => _description = description;

  void increment(int number) =>
      emit(state.copyWith(value: state.value * 10 + number));

  void decrement() => emit(state.copyWith(value: state.value ~/ 10));

  void addExpense() => execute<bool>(
        useCase: Stream.fromFuture(
          _addExpense.execute(
            Expense(
              date: state.date,
              category: _currentCategory,
              value: state.value / 100,
              description: _description,
            ),
          ),
        ),
        then: (result) => emit(state.copyWith(added: result)),
        emitLoading: false,
      );
}
