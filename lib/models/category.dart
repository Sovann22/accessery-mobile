class Category {
  final String id;
  final String name;
  final String icon;
  final String image;

  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      image: json['image'],
    );
  }
}
