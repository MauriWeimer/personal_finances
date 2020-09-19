import '../entities/category.dart';

abstract class CategoriesRepository {
  List<Category> getCategories();
  Future<bool> saveCategories();
}
