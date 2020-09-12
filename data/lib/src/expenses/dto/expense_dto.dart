import 'package:domain/domain.dart';

import '../../dates/dto/date_dto.dart';

class ExpenseDto {
  final String category;
  final DateDto date;
  final double total;
  final String description;

  ExpenseDto({
    this.category,
    this.date,
    this.total,
    this.description,
  });

  factory ExpenseDto.fromMap(Map<String, dynamic> map) => ExpenseDto(
        category: map['category'],
        date: DateDto(
          year: map['year'],
          month: map['month'],
          day: map['day'],
        ),
        total: (map['total'] as num).toDouble(),
        description: map['description'],
      );
}

extension ExpenseDtoX on ExpenseDto {
  Expense toDomain() => Expense(
        date: date.toDomain(),
        category: Category(name: category, icon: ''),
        total: total,
        description: description,
      );
}
