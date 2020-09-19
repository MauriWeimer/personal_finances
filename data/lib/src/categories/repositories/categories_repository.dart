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
  List<Category> getCategories() => _categoriesLocalDataSource.getCategories();

  @override
  Future<bool> saveCategories() =>
      _categoriesRemoteDataSource.getCategories().then(
            (models) => _categoriesLocalDataSource.saveCategories(models),
          );
}
