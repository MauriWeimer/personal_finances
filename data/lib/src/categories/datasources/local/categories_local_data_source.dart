import 'package:domain/domain.dart';

abstract class CategoriesLocalDataSource {
  Future<List<Category>> getCategories();
  Future<bool> saveCategories(List<Category> categories);
}