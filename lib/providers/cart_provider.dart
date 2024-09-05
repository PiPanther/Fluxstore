import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopro/models/data_model.dart';

// Cart state notifier for managing cart products
class CartNotifier extends StateNotifier<List<Product>> {
  CartNotifier() : super([]);

  // Add product to the cart
  void addProduct(Product product) {
    state = [...state, product];
  }

  // Remove product from the cart
  void removeProduct(Product product) {
    state = state.where((p) => p.id != product.id).toList();
  }

  // Calculate the total price of all products in the cart
  double getTotalAmount() {
    return state.fold(0.0, (sum, product) => sum + product.price!);
  }

  // Check if the cart contains the product
  bool isProductInCart(Product product) {
    return state.any((p) => p.id == product.id);
  }
}

// The provider to access the cart
final cartProvider = StateNotifierProvider<CartNotifier, List<Product>>((ref) {
  return CartNotifier();
});
