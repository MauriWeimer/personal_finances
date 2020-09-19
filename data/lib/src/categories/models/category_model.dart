import 'dart:convert';

class CategoryModel {
  final String name;
  final String icon;

  const CategoryModel({this.name, this.icon});

  factory CategoryModel.fromMap(Map<String, dynamic> map) =>
      CategoryModel(name: map['name'], icon: map['icon']);

  factory CategoryModel.fromJson(String json) =>
      CategoryModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {'name': name, 'icon': icon};

  String toJson() => jsonEncode(toMap());
}
