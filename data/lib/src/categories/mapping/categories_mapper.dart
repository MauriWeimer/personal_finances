import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';

import '../models/category_model.dart';

class CategoriesMapper {
  static List<CategoryModel> modelsFromFirestore(QuerySnapshot snapshot) =>
      snapshot.docs
          .map((doc) => CategoryModel.fromMap(doc.data()))
          .toList();   

  static Category categoryFromModel(CategoryModel model) =>
      Category(name: model.name, icon: null);

  static CategoryModel categoryToModel(Category entity) => CategoryModel(
        name: entity.name,
        icon: null,
      );
}
