import '../models/product.dart';
import '../models/category.dart';

class ProductService {
  static List<Category> getCategories() {
    return [
      Category(
        id: '1',
        name: 'Cases',
        icon: '📱',
        image: '/placeholder.svg?height=100&width=100',
      ),
      Category(
        id: '2',
        name: 'Chargers',
        icon: '🔌',
        image: '/placeholder.svg?height=100&width=100',
      ),
      Category(
        id: '3',
        name: 'Headphones',
        icon: '🎧',
        image: '/placeholder.svg?height=100&width=100',
      ),
      Category(
        id: '4',
        name: 'Screen Protectors',
        icon: '🛡️',
        image: '/placeholder.svg?height=100&width=100',
      ),
      Category(
        id: '5',
        name: 'Cables',
        icon: '🔗',
        image: '/placeholder.svg?height=100&width=100',
      ),
      Category(
        id: '6',
        name: 'Stands',
        icon: '📐',
        image: '/placeholder.svg?height=100&width=100',
      ),
    ];
  }

  static List<Product> getFeaturedProducts() {
    return [
      Product(
        id: '1',
        name: 'Premium Leather Case',
        description:
            'Luxury leather case with card slots and magnetic closure. Perfect protection for your device with premium materials and craftsmanship.',
        price: 49.99,
        images: [
          '/placeholder.svg?height=300&width=300',
          '/placeholder.svg?height=300&width=300',
          '/placeholder.svg?height=300&width=300',
        ],
        category: 'Cases',
        rating: 4.8,
        reviewCount: 124,
        brand: 'LuxeCase',
        features: [
          'Genuine leather construction',
          'Card slots and cash pocket',
          'Magnetic closure',
          'Wireless charging compatible',
          'Drop protection up to 6ft',
        ],
      ),
      Product(
        id: '2',
        name: 'Fast Wireless Charger',
        description:
            'Ultra-fast 15W wireless charging pad with LED indicator and foreign object detection. Compatible with all Qi-enabled devices.',
        price: 29.99,
        images: [
          '/placeholder.svg?height=300&width=300',
          '/placeholder.svg?height=300&width=300',
        ],
        category: 'Chargers',
        rating: 4.6,
        reviewCount: 89,
        brand: 'PowerTech',
        features: [
          '15W fast wireless charging',
          'LED charging indicator',
          'Foreign object detection',
          'Non-slip surface',
          'Universal compatibility',
        ],
      ),
      Product(
        id: '3',
        name: 'Noise-Cancelling Earbuds',
        description:
            'Premium wireless earbuds with active noise cancellation and 24-hour battery life. Experience crystal-clear audio quality.',
        price: 149.99,
        images: [
          '/placeholder.svg?height=300&width=300',
          '/placeholder.svg?height=300&width=300',
          '/placeholder.svg?height=300&width=300',
        ],
        category: 'Headphones',
        rating: 4.9,
        reviewCount: 256,
        brand: 'SoundMax',
        features: [
          'Active noise cancellation',
          '24-hour battery life',
          'IPX4 water resistance',
          'Touch controls',
          'Premium sound quality',
        ],
      ),
    ];
  }

  static List<Product> getAllProducts() {
    return [
      ...getFeaturedProducts(),
      // Cases
      Product(
        id: '4',
        name: 'Clear Protective Case',
        description:
            'Crystal clear case that shows off your phone while providing excellent protection.',
        price: 19.99,
        images: ['/placeholder.svg?height=300&width=300'],
        category: 'Cases',
        rating: 4.3,
        reviewCount: 78,
        brand: 'ClearGuard',
        features: [
          'Crystal clear transparency',
          'Shock-absorbing corners',
          'Scratch-resistant',
          'Easy installation',
          'Wireless charging compatible',
        ],
      ),
      Product(
        id: '5',
        name: 'Rugged Armor Case',
        description:
            'Military-grade protection with reinforced corners and impact resistance.',
        price: 34.99,
        images: ['/placeholder.svg?height=300&width=300'],
        category: 'Cases',
        rating: 4.7,
        reviewCount: 156,
        brand: 'ArmorTech',
        features: [
          'Military-grade protection',
          'Reinforced corners',
          'Impact resistant',
          'Dust and dirt protection',
          'Precise cutouts',
        ],
      ),
      // Chargers
      Product(
        id: '6',
        name: 'USB-C Fast Charger',
        description:
            '30W USB-C wall charger with Power Delivery for rapid charging.',
        price: 24.99,
        images: ['/placeholder.svg?height=300&width=300'],
        category: 'Chargers',
        rating: 4.5,
        reviewCount: 92,
        brand: 'PowerTech',
        features: [
          '30W Power Delivery',
          'USB-C connector',
          'Compact design',
          'Universal compatibility',
          'Safety certified',
        ],
      ),
      Product(
        id: '7',
        name: 'Portable Power Bank',
        description: '10,000mAh portable battery pack with dual USB outputs.',
        price: 39.99,
        images: ['/placeholder.svg?height=300&width=300'],
        category: 'Chargers',
        rating: 4.4,
        reviewCount: 203,
        brand: 'PowerBank Pro',
        features: [
          '10,000mAh capacity',
          'Dual USB outputs',
          'LED battery indicator',
          'Fast charging support',
          'Compact and lightweight',
        ],
      ),
      // Headphones
      Product(
        id: '8',
        name: 'Wireless Over-Ear Headphones',
        description:
            'Premium over-ear headphones with superior sound quality and comfort.',
        price: 89.99,
        images: ['/placeholder.svg?height=300&width=300'],
        category: 'Headphones',
        rating: 4.6,
        reviewCount: 134,
        brand: 'AudioMax',
        features: [
          'Premium sound quality',
          'Comfortable padding',
          '20-hour battery life',
          'Bluetooth 5.0',
          'Foldable design',
        ],
      ),
      Product(
        id: '9',
        name: 'Sports Earbuds',
        description:
            'Sweat-resistant wireless earbuds perfect for workouts and sports.',
        price: 59.99,
        images: ['/placeholder.svg?height=300&width=300'],
        category: 'Headphones',
        rating: 4.2,
        reviewCount: 87,
        brand: 'SportSound',
        features: [
          'Sweat-resistant design',
          'Secure fit',
          '8-hour battery life',
          'Quick charge',
          'Built-in microphone',
        ],
      ),
      // Screen Protectors
      Product(
        id: '10',
        name: 'Tempered Glass Screen Protector',
        description:
            'Ultra-clear tempered glass with 9H hardness and oleophobic coating.',
        price: 12.99,
        images: ['/placeholder.svg?height=300&width=300'],
        category: 'Screen Protectors',
        rating: 4.5,
        reviewCount: 67,
        brand: 'GlassGuard',
        features: [
          '9H hardness rating',
          'Ultra-clear transparency',
          'Oleophobic coating',
          'Bubble-free installation',
          'Case-friendly design',
        ],
      ),
      Product(
        id: '11',
        name: 'Privacy Screen Protector',
        description:
            'Protect your privacy with this anti-spy screen protector.',
        price: 18.99,
        images: ['/placeholder.svg?height=300&width=300'],
        category: 'Screen Protectors',
        rating: 4.1,
        reviewCount: 45,
        brand: 'PrivacyShield',
        features: [
          'Privacy protection',
          'Anti-spy technology',
          'Scratch resistant',
          'Easy installation',
          'Maintains touch sensitivity',
        ],
      ),
      // Cables
      Product(
        id: '12',
        name: 'USB-C to Lightning Cable',
        description:
            'MFi certified cable with fast charging and data sync capabilities.',
        price: 19.99,
        images: ['/placeholder.svg?height=300&width=300'],
        category: 'Cables',
        rating: 4.7,
        reviewCount: 143,
        brand: 'ConnectPro',
        features: [
          'MFi certified',
          'Fast charging support',
          'Data sync capability',
          'Durable braided design',
          '3ft length',
        ],
      ),
      Product(
        id: '13',
        name: 'Magnetic Charging Cable',
        description: 'Magnetic connector cable for easy one-handed charging.',
        price: 22.99,
        images: ['/placeholder.svg?height=300&width=300'],
        category: 'Cables',
        rating: 4.3,
        reviewCount: 76,
        brand: 'MagConnect',
        features: [
          'Magnetic connection',
          'One-handed operation',
          'LED indicator',
          'Durable construction',
          '6ft length',
        ],
      ),
      // Stands
      Product(
        id: '14',
        name: 'Adjustable Phone Stand',
        description:
            'Foldable aluminum stand with adjustable angles for optimal viewing.',
        price: 24.99,
        images: ['/placeholder.svg?height=300&width=300'],
        category: 'Stands',
        rating: 4.4,
        reviewCount: 92,
        brand: 'StandPro',
        features: [
          'Adjustable viewing angles',
          'Foldable design',
          'Aluminum construction',
          'Non-slip base',
          'Universal compatibility',
        ],
      ),
      Product(
        id: '15',
        name: 'Car Phone Mount',
        description:
            'Secure car mount with 360-degree rotation and strong grip.',
        price: 16.99,
        images: ['/placeholder.svg?height=300&width=300'],
        category: 'Stands',
        rating: 4.2,
        reviewCount: 118,
        brand: 'CarMount Pro',
        features: [
          '360-degree rotation',
          'Strong grip mechanism',
          'Easy installation',
          'Dashboard or windshield mount',
          'One-handed operation',
        ],
      ),
    ];
  }

  static List<Product> getProductsByCategory(String category) {
    final allProducts = getAllProducts();
    return allProducts
        .where((product) => product.category == category)
        .toList();
  }

  static Product? getProductById(String id) {
    try {
      return getAllProducts().firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }

  static List<Product> searchProducts(String query) {
    final allProducts = getAllProducts();
    return allProducts.where((product) {
      return product.name.toLowerCase().contains(query.toLowerCase()) ||
          product.description.toLowerCase().contains(query.toLowerCase()) ||
          product.category.toLowerCase().contains(query.toLowerCase()) ||
          product.brand.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
}
