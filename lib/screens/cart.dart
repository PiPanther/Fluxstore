import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopro/constants/constants.dart';
import 'package:shopro/providers/cart_provider.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final cartNotifier = ref.watch(cartProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("Your Cart", style: kAppBarTitleStyle),
      ),
      body: cart.isEmpty
          ? const Center(
              child: Text("Your cart is empty", style: kStockTextStyle),
            )
          : Padding(
              padding: kPaddingAll,
              child: Card(
                elevation: kCardElevation,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: cart.length,
                        itemBuilder: (context, index) {
                          final product = cart[index];
                          return ListTile(
                            title:
                                Text(product.title!, style: kProductTitleStyle),
                            subtitle:
                                Text("\$${product.price?.toStringAsFixed(2)}"),
                            trailing: IconButton(
                              icon: const Icon(Icons.remove_shopping_cart),
                              onPressed: () {
                                cartNotifier.removeProduct(product);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    Card(
                      elevation: kCardElevation,
                      color: Colors.white,
                      child: Padding(
                        padding: kPaddingAll,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Total:", style: kTotalLabelStyle),
                            Text(
                                "\$${cartNotifier.getTotalAmount().toStringAsFixed(2)}",
                                style: kTotalAmountStyle),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
