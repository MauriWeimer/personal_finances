import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';

import '../../dates/mapping/dates_mapper.dart';
import '../../dates/models/date_model.dart';
import '../../categories/mapping/categories_mapper.dart';
import '../../categories/models/category_model.dart';
import '../models/expense_model.dart';
import '../models/expenses_model.dart';

class ExpensesMapper {
  static Expenses expensesFromFirestore(QuerySnapshot snapshot) =>
      expensesFromModel(ExpensesModel(
        expenses: snapshot.docs
            .map((doc) => ExpenseModel.fromMap(doc.data()))
            .toList(),
      ));

  static Expenses expensesFromModel(ExpensesModel model) => Expenses(
        expenses:
            model.expenses.map((expense) => expenseFromModel(expense)).toList(),
      );

  static Expense expenseFromModel(ExpenseModel model) => Expense(
        date: DatesMapper.dateFromModel(model.date),
        category: CategoriesMapper.categoryFromModel(model.category),
        value: model.value,
        description: model.description,
      );
}
