import 'package:domain/domain.dart';

class AddExpenseState {
  final int value;
  final Date date;
  final bool added;

  const AddExpenseState({this.value, this.date, this.added});

  AddExpenseState copyWith({int value, bool added}) => AddExpenseState(
        value: value ?? this.value,
        date: date,
        added: added ?? this.added,
      );
}
