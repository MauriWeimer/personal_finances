import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';

import './categories_remote_data_source.dart';
import '../../mapping/categories_mapper.dart';

class CategoriesFirestoreDataSource implements CategoriesRemoteDataSource {
  final FirebaseFirestore _firebaseFirestore;

  const CategoriesFirestoreDataSource(this._firebaseFirestore);

  @override
  Future<List<Category>> getCategories() =>
      _firebaseFirestore.collection('categories').get().then(
            (snapshot) => CategoriesMapper.categoriesFromFirestore(snapshot),
          );
}
