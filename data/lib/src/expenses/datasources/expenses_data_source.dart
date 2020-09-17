import 'package:domain/domain.dart';

abstract class ExpensesDataSource {
  Stream<Expenses> getByDate(Date date);
}