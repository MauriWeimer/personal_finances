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

  //Datasources
  g.registerLazySingleton<DatesRemoteDataSource>(
    () => DatesFirestoreDataSource(g()),
  );
  g.registerLazySingleton<ExpensesRemoteDataSource>(
    () => ExpensesFirestoreDataSource(g()),
  );
  g.registerLazySingleton<CategoriesRemoteDataSource>(
    () => CategoriesFirestoreDataSource(g()),
  );
  g.registerLazySingleton<CategoriesLocalDataSource>(
    () => CategoriesHiveDataSource(),
  );

  //Repositories
  g.registerLazySingleton<DatesRepository>(
    () => DatesRepositoryImpl(g()),
  );
  g.registerLazySingleton<ExpensesRepository>(
    () => ExpensesRepositoryImpl(g()),
  );
  g.registerLazySingleton<CategoriesRepository>(
    () => CategoriesRepositoryImpl(g(), g()),
  );

  //Usecases
  g.registerLazySingleton(
    () => GetAllDates(g()),
  );
  g.registerLazySingleton(
    () => GetExpensesByDate(g()),
  );
  g.registerLazySingleton(
    () => GetCategories(g()),
  );
  g.registerLazySingleton(
    () => SaveCategories(g()),
  );
}
