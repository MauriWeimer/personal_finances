import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';

import '../models/category_model.dart';

class CategoriesMapper {
  static List<Category> categoriesFromFirestore(QuerySnapshot snapshot) =>
      snapshot.docs
          .map((doc) => categoryFromModel(CategoryModel.fromMap(doc.data())))
          .toList();

  static Category categoryFromModel(CategoryModel model) =>
      Category(name: model.name, icon: null);
}
