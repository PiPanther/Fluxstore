import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopro/components/product_category_tile.dart';
import 'package:shopro/components/search_delegate.dart';
import 'package:shopro/constants/constants.dart';
import 'package:shopro/providers/product_list_provider.dart';
import 'package:shopro/screens/cart.dart';
import 'package:shopro/screens/product_description.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    final products = ref.watch(productProvider);
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 3,
        title: SizedBox(
          height: 35,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'lib/assets/store.png',
                height: 25,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text('Fluxstore'),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.cart,
              weight: 3,
              fill: BorderSide.strokeAlignCenter,
            ),
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const CartScreen())),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.black,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 10),
            height: 190,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return ProductCategoryTile(
                            imgUrl: categoriesUrl[index],
                            name: categories[index]);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SearchBar(
                    hintText: "Search Products",
                    controller: searchController,
                    leading: const Icon(CupertinoIcons.search),
                    keyboardType: TextInputType.text,
                    onSubmitted: (value) {
                      products.when(
                        data: (products) {
                          // Show the search delegate when a query is submitted
                          showSearch(
                            context: context,
                            delegate: ProductSearchDelegate(products),
                            query: value, // Pass the search query
                          );
                        },
                        loading: () =>
                            const CircularProgressIndicator(), // Handle loading
                        error: (err, stack) =>
                            const SizedBox.shrink(), // Handle error
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: products.when(
              data: (products) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 12),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDescription(product: product)));
                          },
                          child: Card(
                            color: Colors.purple.shade50,
                            elevation: 1,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 4),
                              child: SizedBox(
                                height: 125,
                                child: Row(
                                  children: [
                                    Card(
                                      elevation: 5,
                                      child: Image.network(
                                        fit: BoxFit.contain,
                                        product.thumbnail.toString(),
                                        height: 132,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            product.title.toString(),
                                            softWrap: true,
                                            overflow: TextOverflow.fade,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54),
                                          ),
                                          Text(
                                            product.brand.toString(),
                                            softWrap: true,
                                            overflow: TextOverflow.fade,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black45),
                                          ),
                                          const Spacer(),
                                          Expanded(
                                              child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                " ⭐ ${product.rating.toString()}",
                                                style: const TextStyle(
                                                    fontSize: 12),
                                              ),
                                              const SizedBox(
                                                width: 180,
                                              ),
                                              Text(
                                                "\$${product.price.toString()} ",
                                                style: const TextStyle(
                                                    overflow: TextOverflow.fade,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              error: (err, stack) => Center(
                child: Text(err.toString()),
              ),
              loading: () => Container(
                height: MediaQuery.of(context).size.height - 264,
                alignment: Alignment.center,
                child: const CircularProgressIndicator.adaptive(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
