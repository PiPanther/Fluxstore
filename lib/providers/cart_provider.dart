import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopro/models/data_model.dart';

// Cart state notifier for managing cart products
class CartNotifier extends StateNotifier<List<Product>> {
  CartNotifier() : super([]);

  // Add product to the cart
  void addProduct(Product product) {
    // Check if the product already exists in the cart
    final existingProductIndex = state.indexWhere((p) => p.id == product.id);
    if (existingProductIndex >= 0) {
      // If exists, update quantity
      final existingProduct = state[existingProductIndex];
      final updatedProduct = Product(
        id: existingProduct.id,
        title: existingProduct.title,
        price: existingProduct.price,
        thumbnail: existingProduct.thumbnail,
        quantity: existingProduct.quantity! + 1,
      );
      state = [
        ...state..removeAt(existingProductIndex), 
        updatedProduct
      ];
    } else {
      // If not exists, add new product with quantity 1
      state = [...state, product];
    }
  }

  // Remove product from the cart
  void removeProduct(Product product) {
    final existingProductIndex = state.indexWhere((p) => p.id == product.id);
    if (existingProductIndex >= 0) {
      final existingProduct = state[existingProductIndex];
      if (existingProduct.quantity! > 1) {
        // Decrease quantity if more than 1
        final updatedProduct = Product(
          id: existingProduct.id,
          title: existingProduct.title,
          price: existingProduct.price,
          thumbnail: existingProduct.thumbnail,
          quantity: existingProduct.quantity! - 1,
        );
        state = [
          ...state..removeAt(existingProductIndex), 
          updatedProduct
        ];
      } else {
        // Remove product if quantity is 1
        state = state.where((p) => p.id != product.id).toList();
      }
    }
  }

  // Calculate the total price of all products in the cart
  double getTotalAmount() {
    return state.fold(0.0, (sum, product) => sum + (product.price! * product.quantity!));
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
