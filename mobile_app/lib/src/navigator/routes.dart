import 'package:personal_finances/src/ui/pages/splash/splash_page.dart';

import '../ui/pages/home/home_page.dart';
import '../ui/pages/add_expenses/add_expenses_page.dart';

final kRoutes = {
  kSplashRoute: (_) => SplashPage(),
  kHomeRoute: (_) => HomePage(),
  kAddExpensesRoute: (_) => AddExpensesPage(),
};

const kSplashRoute = '/splash';
const kHomeRoute = '/home';
const kAddExpensesRoute = '/add_expenses';
