import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../models/product.dart';
import '../utils/logger.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalAmount =>
      _items.fold(0.0, (sum, item) => sum + item.totalPrice);

  void addItem(Product product) {
    try {
      logger.debug('Adding item to cart: $product.name', tag: 'CART');

      final existingIndex = _items.indexWhere(
        (item) => item.product.id == product.id,
      );

      if (existingIndex >= 0) {
        _items[existingIndex].quantity++;
        logger.info('Updated quantity for existing item', tag: 'CART');
        logger.userAction(
          'cart_item_quantity_updated',
          data: {
            'product_id': product.id,
            'product_name': product.name,
            'new_quantity': _items[existingIndex].quantity,
          },
        );
      } else {
        _items.add(CartItem(product: product));
        logger.info('Added new item to cart', tag: 'CART');
        logger.userAction(
          'cart_item_added',
          data: {
            'product_id': product.id,
            'product_name': product.name,
            'price': product.price,
          },
        );
      }

      logger.debug(
        'Cart now has $itemCount items, total: \$${totalAmount.toStringAsFixed(2)}',
        tag: 'CART',
      );
      notifyListeners();
    } catch (e, stackTrace) {
      logger.error(
        'Error adding item to cart',
        tag: 'CART',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  void removeItem(String productId) {
    try {
      logger.debug('Removing item from cart: $productId', tag: 'CART');

      final removedItem = _items.firstWhere(
        (item) => item.product.id == productId,
      );
      _items.removeWhere((item) => item.product.id == productId);

      logger.info('Removed item from cart', tag: 'CART');
      logger.userAction(
        'cart_item_removed',
        data: {
          'product_id': productId,
          'product_name': removedItem.product.name,
          'quantity_removed': removedItem.quantity,
        },
      );

      logger.debug(
        'Cart now has $itemCount items, total: \$${totalAmount.toStringAsFixed(2)}',
        tag: 'CART',
      );
      notifyListeners();
    } catch (e, stackTrace) {
      logger.error(
        'Error removing item from cart',
        tag: 'CART',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  void updateQuantity(String productId, int quantity) {
    try {
      logger.debug(
        'Updating quantity for item: $productId to $quantity',
        tag: 'CART',
      );

      final index = _items.indexWhere((item) => item.product.id == productId);
      if (index >= 0) {
        final oldQuantity = _items[index].quantity;

        if (quantity <= 0) {
          removeItem(productId);
          return;
        } else {
          _items[index].quantity = quantity;

          logger.info('Updated item quantity', tag: 'CART');
          logger.userAction(
            'cart_item_quantity_changed',
            data: {
              'product_id': productId,
              'product_name': _items[index].product.name,
              'old_quantity': oldQuantity,
              'new_quantity': quantity,
            },
          );
        }

        logger.debug(
          'Cart now has $itemCount items, total: \$${totalAmount.toStringAsFixed(2)}',
          tag: 'CART',
        );
        notifyListeners();
      } else {
        logger.warning(
          'Attempted to update quantity for non-existent item: $productId',
          tag: 'CART',
        );
      }
    } catch (e, stackTrace) {
      logger.error(
        'Error updating item quantity',
        tag: 'CART',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  void clearCart() {
    try {
      logger.info('Clearing cart', tag: 'CART');

      final itemCount = _items.length;
      final totalValue = totalAmount;

      _items.clear();

      logger.info('Cart cleared successfully', tag: 'CART');
      logger.userAction(
        'cart_cleared',
        data: {'items_removed': itemCount, 'total_value': totalValue},
      );

      notifyListeners();
    } catch (e, stackTrace) {
      logger.error(
        'Error clearing cart',
        tag: 'CART',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  bool isInCart(String productId) {
    return _items.any((item) => item.product.id == productId);
  }

  int getQuantity(String productId) {
    final item = _items.firstWhere(
      (item) => item.product.id == productId,
      orElse:
          () => CartItem(
            product: Product(
              id: '',
              name: '',
              description: '',
              price: 0,
              images: [],
              category: '',
            ),
            quantity: 0,
          ),
    );
    return item.quantity;
  }
}
