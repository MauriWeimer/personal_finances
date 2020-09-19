class Category {
  final String name;
  final String icon;

  const Category({this.name, this.icon});

  @override
  bool operator ==(dynamic other) =>
      identical(other, this) || (other is Category && (other.name == name));

  @override
  int get hashCode => name.hashCode;
}
