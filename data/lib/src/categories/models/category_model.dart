class CategoryModel {
  final String name;
  final String icon;

  const CategoryModel({this.name, this.icon});

  factory CategoryModel.fromMap(Map<String, dynamic> map) =>
      CategoryModel(name: map['name'], icon: map['icon']);
}
