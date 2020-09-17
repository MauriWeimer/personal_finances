import '../repositories/categories_repository.dart';

class SaveCategories {
  final CategoriesRepository _categoriesRepository;

  const SaveCategories(this._categoriesRepository);

  Future<bool> execute() => _categoriesRepository.getRemoteCategories().then(
        (categories) => _categoriesRepository.saveCategories(categories),
      );
}
