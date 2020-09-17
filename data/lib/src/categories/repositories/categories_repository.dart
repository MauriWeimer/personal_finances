import 'package:domain/domain.dart';

import '../datasources/local/categories_local_data_source.dart';
import '../datasources/remote/categories_remote_data_source.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesLocalDataSource _categoriesLocalDataSource;
  final CategoriesRemoteDataSource _categoriesRemoteDataSource;

  const CategoriesRepositoryImpl(
    this._categoriesLocalDataSource,
    this._categoriesRemoteDataSource,
  );

  @override
  Future<List<Category>> getLocalCategories() =>
      _categoriesLocalDataSource.getCategories();

  @override
  Future<List<Category>> getRemoteCategories() =>
      _categoriesRemoteDataSource.getCategories();

  @override
  Future<bool> saveCategories(List<Category> categories) =>
      _categoriesLocalDataSource.saveCategories(categories);
}
