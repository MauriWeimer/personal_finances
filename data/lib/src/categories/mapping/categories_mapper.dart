import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';

import '../models/category_model.dart';

class CategoriesMapper {
  static List<CategoryModel> modelsFromFirestore(QuerySnapshot snapshot) =>
      snapshot.docs
          .map((doc) => CategoryModel.fromMap(doc.data()).copyWithId(doc.id))
          .toList();

  static Category categoryFromModel(CategoryModel model) =>
      Category(id: model.id, name: model.name, icon: model.icon);

  static CategoryModel categoryToModel(Category entity) => CategoryModel(
        id: entity.id,
        name: entity.name,
        icon: entity.icon,
      );
}
