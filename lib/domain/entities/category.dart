class Category {
  final int id;
  final String name;
  final List<Subcategory> subcategories;

  Category({
    required this.id,
    required this.name,
    required this.subcategories,
  });
}

class Subcategory {
  final int id;
  final String name;

  Subcategory({
    required this.id,
    required this.name,
  });
}
