import 'package:flutter/material.dart';
import 'models/product.dart';
import 'product_card.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      itemCount: Product.items.length,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 12);
      },
      itemBuilder: (context, index) {
        final item = Product.items.elementAt(index);
        return ProductCard(
          product: item,
        );
      },
    );
  }
}
