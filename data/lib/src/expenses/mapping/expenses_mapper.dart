import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';

import '../../dates/mapping/date_mapper.dart';
import '../../dates/models/date_model.dart';
import '../models/expense_model.dart';
import '../models/expenses_model.dart';

class ExpensesMapper {
  static Expenses expensesFromFirestore(QuerySnapshot snapshot) =>
      expensesFromModel(ExpensesModel(
        expenses: snapshot.docs
            .map(
              (doc) => expenseModelFromMap(doc.data()),
            )
            .toList(),
      ));

  static Expenses expensesFromModel(ExpensesModel model) => Expenses(
        expenses: model.expenses
            .map(
              (expense) => expenseFromModel(expense),
            )
            .toList(),
      );

  static ExpenseModel expenseModelFromMap(Map<String, dynamic> map) =>
      ExpenseModel(
        category: map['category'],
        date: DateModel(
          year: map['year'],
          month: map['month'],
          day: map['day'],
        ),
        value: (map['value'] as num).toDouble(),
        description: map['description'],
      );

  static Expense expenseFromModel(ExpenseModel model) => Expense(
        date: DateMapper.dateFromModel(model.date),
        category: Category(name: model.category, icon: ''),
        value: model.value,
        description: model.description,
      );
}
