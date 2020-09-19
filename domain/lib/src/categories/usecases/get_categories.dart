import '../repositories/categories_repository.dart';

import '../entities/category.dart';

class GetCategories {
  final CategoriesRepository _categoriesRepository;

  const GetCategories(this._categoriesRepository);

  List<Category> execute() => _categoriesRepository.getCategories();
}
