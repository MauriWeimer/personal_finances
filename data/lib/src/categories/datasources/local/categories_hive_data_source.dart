import 'package:domain/domain.dart';

import './categories_local_data_source.dart';

class CategoriesHiveDataSource implements CategoriesLocalDataSource {
  @override
  Future<List<Category>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<bool> saveCategories(List<Category> categories) => Future.value(true);
}