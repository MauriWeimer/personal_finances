import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';

import '../../dates/mapping/dates_mapper.dart';
import '../models/expense_model.dart';
import '../models/expenses_model.dart';

class ExpensesMapper {
  static Expenses expensesFromFirestore(
    QuerySnapshot snapshot,
    List<Category> categories,
  ) =>
      expensesFromModel(
        ExpensesModel(
          expenses: snapshot.docs
              .map((doc) => ExpenseModel.fromMap(doc.data()))
              .toList(),
        ),
        categories,
      );

  static Expenses expensesFromModel(
    ExpensesModel model,
    List<Category> categories,
  ) =>
      Expenses(
        expenses: model.expenses
            .map((expense) => expenseFromModel(
                  expense,
                  categories,
                ))
            .toList(),
      );

  static Expense expenseFromModel(
    ExpenseModel model,
    List<Category> categories,
  ) =>
      Expense(
        date: DatesMapper.dateFromModel(model.date),
        category: categories.singleWhere(
          (category) => category.id == model.category,
        ),
        value: model.value,
        description: model.description,
      );

  static ExpenseModel expenseToModel(Expense entity) => ExpenseModel(
        date: DatesMapper.dateToModel(entity.date),
        category: entity.category.id,
        value: entity.value,
        description: entity.description,
      );
}
