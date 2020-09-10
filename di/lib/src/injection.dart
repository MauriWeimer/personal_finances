import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';

final g = GetIt.instance;

Future<void> init() async {
  //Repositories
  g.registerLazySingleton<ExpensesRepository>(
    () => ExpensesRepositoryImpl(),
  );

  //Usecases
  g.registerLazySingleton(
    () => GetExpensesByDate(
      g(),
    ),
  );
}
