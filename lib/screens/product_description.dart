import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopro/components/custom_button.dart';
import 'package:shopro/constants/constants.dart';
import 'package:shopro/models/data_model.dart';
import 'package:shopro/providers/cart_provider.dart';

class ProductDescription extends ConsumerWidget {
  final Product product;
  const ProductDescription({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartProvider);
    final cartNotifier = ref.read(cartProvider.notifier);
    final isInCart = cartState.contains(product);

    return Scaffold(
      appBar: AppBar(backgroundColor: kPrimaryColor),
      body: SingleChildScrollView(
        padding: kPaddingAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.brand!, style: kBrandTextStyle),
            Text(product.title!, style: kProductTitleStyle),
            SizedBox(
              height: 500,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: product.images!.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    product.images![index],
                    height: 400,
                    width: 400,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Text("\$${product.price}", style: kPriceTextStyle),
                const SizedBox(width: 5),
                Text("${product.discountPercentage}% off",
                    style: kDiscountTextStyle),
              ],
            ),
            Text(
                product.stock! > 20
                    ? "${product.stock} left"
                    : "Hurry up! Only ${product.stock} left",
                style: kStockTextStyle),
            const SizedBox(height: 5),
            Text(product.description!, style: kProductDescriptionStyle),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(product.warrantyInformation!, style: kWarrantyTextStyle),
                const SizedBox(width: 20),
                Text(product.shippingInformation!, style: kWarrantyTextStyle),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: CustomButton(
          text: isInCart ? "Remove From Cart" : "Add to Cart",
          color: isInCart ? Colors.red : kPrimaryColor,
          textColor: kButtonTextColor,
          function: () {
            if (isInCart) {
              cartNotifier.removeProduct(product);
            } else {
              cartNotifier.addProduct(product);
            }
          },
        ),
      ),
    );
  }
}
