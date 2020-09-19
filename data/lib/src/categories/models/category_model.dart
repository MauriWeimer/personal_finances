import 'dart:convert';

class CategoryModel {
  final String id;
  final String name;
  final String icon;

  const CategoryModel({this.id, this.name, this.icon});

  factory CategoryModel.fromMap(Map<String, dynamic> map) =>
      CategoryModel(id: map['id'], name: map['name'], icon: map['icon']);

  factory CategoryModel.fromJson(String json) =>
      CategoryModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {'id': id, 'name': name, 'icon': icon};

  String toJson() => jsonEncode(toMap());

  CategoryModel copyWithId(String id) => CategoryModel(
        id: id,
        name: name,
        icon: icon,
      );
}
