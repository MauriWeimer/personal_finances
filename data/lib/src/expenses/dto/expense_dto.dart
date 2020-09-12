import 'package:domain/domain.dart';

import '../../dates/dto/date_dto.dart';

class ExpenseDto {
  final String category;
  final DateDto date;
  final double value;
  final String description;

  ExpenseDto({
    this.category,
    this.date,
    this.value,
    this.description,
  });

  factory ExpenseDto.fromMap(Map<String, dynamic> map) => ExpenseDto(
        category: map['category'],
        date: DateDto(
          year: map['year'],
          month: map['month'],
          day: map['day'],
        ),
        value: (map['value'] as num).toDouble(),
        description: map['description'],
      );
}

extension ExpenseDtoX on ExpenseDto {
  Expense toDomain() => Expense(
        date: date.toDomain(),
        category: Category(name: category, icon: ''),
        value: value,
        description: description,
      );
}
