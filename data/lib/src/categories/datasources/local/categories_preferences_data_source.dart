import 'dart:convert';

import 'package:domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './categories_local_data_source.dart';
import '../../mapping/categories_mapper.dart';
import '../../models/category_model.dart';

class CategoriesPreferencesDataSource implements CategoriesLocalDataSource {
  static const _key = 'categories';

  final SharedPreferences _sharedPreferences;

  const CategoriesPreferencesDataSource(this._sharedPreferences);

  @override
  List<Category> getCategories() => _sharedPreferences
      .getStringList(_key)
      .map(
        (json) =>
            CategoriesMapper.categoryFromModel(CategoryModel.fromJson(json)),
      )
      .toList();

  @override
  Future<bool> saveCategories(List<CategoryModel> models) => _sharedPreferences
      .setStringList(_key, models.map((model) => model.toJson()).toList());
}
