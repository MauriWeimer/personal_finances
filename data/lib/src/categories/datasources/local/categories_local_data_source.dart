import 'package:domain/domain.dart';

import '../../models/category_model.dart';

abstract class CategoriesLocalDataSource {
  List<Category> getCategories();
  Future<bool> saveCategories(List<CategoryModel> categories);
}