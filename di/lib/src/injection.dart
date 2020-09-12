import 'package:get_it/get_it.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final g = GetIt.instance;

Future<void> init() async {
  //Firestore
  g.registerLazySingleton(
    () => FirebaseFirestore.instance,
  );

  //Repositories
  g.registerLazySingleton<DatesRepository>(
    () => DatesRepositoryImpl(g()),
  );
  g.registerLazySingleton<ExpensesRepository>(
    () => ExpensesRepositoryImpl(g()),
  );

  //Usecases
  g.registerLazySingleton(
    () => GetAllDates(g()),
  );
  g.registerLazySingleton(
    () => GetExpensesByDate(g()),
  );
}
