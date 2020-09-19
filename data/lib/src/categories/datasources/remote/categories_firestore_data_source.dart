import 'package:cloud_firestore/cloud_firestore.dart';

import './categories_remote_data_source.dart';
import '../../mapping/categories_mapper.dart';
import '../../models/category_model.dart';

class CategoriesFirestoreDataSource implements CategoriesRemoteDataSource {
  final FirebaseFirestore _firebaseFirestore;

  const CategoriesFirestoreDataSource(this._firebaseFirestore);

  @override
  Future<List<CategoryModel>> getCategories() =>
      _firebaseFirestore.collection('categories').get().then(
            (snapshot) => CategoriesMapper.modelsFromFirestore(snapshot),
          );
}
