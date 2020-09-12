import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';

import './expense_dto.dart';

class ExpensesDto {
  List<ExpenseDto> expenses;

  ExpensesDto({this.expenses});

  factory ExpensesDto.fromFirestore(QuerySnapshot snapshot) => ExpensesDto(
        expenses: snapshot.docs
            .map(
              (doc) => ExpenseDto.fromMap(doc.data()),
            )
            .toList(),
      );
}

extension ExpensesDtoX on ExpensesDto {
  Expenses toDomain() => Expenses(
        expenses: expenses.map((expense) => expense.toDomain()).toList(),
      );
}
