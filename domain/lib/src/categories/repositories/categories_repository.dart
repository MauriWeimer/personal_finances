import '../entities/category.dart';

abstract class CategoriesRepository {
  Future<List<Category>> getLocalCategories();
  Future<List<Category>> getRemoteCategories();
  Future<bool> saveCategories(List<Category> categories);
}