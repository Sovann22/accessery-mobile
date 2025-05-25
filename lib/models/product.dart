class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final List<String> images;
  final String category;
  final double rating;
  final int reviewCount;
  final bool isInStock;
  final List<String> features;
  final String brand;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.images,
    required this.category,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.isInStock = true,
    this.features = const [],
    this.brand = '',
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      images: List<String>.from(json['images']),
      category: json['category'],
      rating: json['rating']?.toDouble() ?? 0.0,
      reviewCount: json['reviewCount'] ?? 0,
      isInStock: json['isInStock'] ?? true,
      features: List<String>.from(json['features'] ?? []),
      brand: json['brand'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'images': images,
      'category': category,
      'rating': rating,
      'reviewCount': reviewCount,
      'isInStock': isInStock,
      'features': features,
      'brand': brand,
    };
  }
}
