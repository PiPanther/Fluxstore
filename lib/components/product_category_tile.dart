import 'package:flutter/material.dart';

class ProductCategoryTile extends StatelessWidget {
  final String imgUrl;
  final String name;
  const ProductCategoryTile(
      {super.key, required this.imgUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imgUrl,
                height: 35,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              name,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
