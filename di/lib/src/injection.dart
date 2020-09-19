import 'package:get_it/get_it.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

final g = GetIt.instance;

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  //Firestore
  g.registerSingleton(FirebaseFirestore.instance);

  //SharedPreferences
  g.registerSingleton(sharedPreferences);

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
    () => CategoriesPreferencesDataSource(g()),
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
