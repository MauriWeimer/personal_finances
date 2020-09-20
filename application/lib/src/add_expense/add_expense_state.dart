import 'package:domain/domain.dart';

class AddExpenseState {
  final List<Category> categories;
  final Category currentCategory;
  final Date date;
  final int value;
  final String description;
  final bool added;

  const AddExpenseState({
    this.categories,
    this.currentCategory,
    this.date,
    this.value,
    this.description,
    this.added,
  });

  AddExpenseState copyWith({
    Category currentCategory,
    int value,
    String description,
    bool added,
  }) =>
      AddExpenseState(
        categories: categories,
        currentCategory: currentCategory ?? this.currentCategory,
        date: date,
        value: value ?? this.value,
        description: description ?? this.description,
        added: added ?? this.added,
      );
}
