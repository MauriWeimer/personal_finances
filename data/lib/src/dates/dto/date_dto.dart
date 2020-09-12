import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';

class DateDto {
  final int year;
  final int month;
  final int day;

  DateDto({
    this.year,
    this.month,
    this.day,
  });

  factory DateDto.fromMap(Map<String, dynamic> map) => DateDto(
        year: map['year'],
        month: map['month'],
        day: map['day'],
      );

  factory DateDto.fromFirestore(QuerySnapshot snapshot) => DateDto.fromMap(
        snapshot.docs.first.data(),
      );
}

extension DateDtoX on DateDto {
  Date toDomain() => Date(
        year: year,
        month: month,
        day: day,
      );
}
