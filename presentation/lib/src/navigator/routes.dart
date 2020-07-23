import '../ui/pages/home/home_page.dart';
import '../ui/pages/add_expenses/add_expenses_page.dart';

final homeRoute = '/home';
final addExpensesRoute = '/add_expenses';

final routes = {
  homeRoute : (_) => HomePage(),
  addExpensesRoute : (_) => AddExpensesPage(),
};