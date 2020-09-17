import 'package:domain/domain.dart';

abstract class CategoriesRemoteDataSource {
  Future<List<Category>> getCategories();
}