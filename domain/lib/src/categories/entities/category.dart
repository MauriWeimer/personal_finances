class Category {
  final String id;
  final String name;
  final String icon;

  const Category({this.id, this.name, this.icon});

  @override
  bool operator ==(dynamic other) =>
      identical(other, this) || (other is Category && (other.id == id));

  @override
  int get hashCode => id.hashCode;
}
