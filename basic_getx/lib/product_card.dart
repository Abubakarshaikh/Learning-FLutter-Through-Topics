import 'package:basic_getx/models/shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'models/product.dart';
import 'controller/shopping_cart_controller.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ShoppingCartController shoppingCartController =
        Get.put(ShoppingCartController());
    return LimitedBox(
      maxHeight: 120,
      child: Row(
        children: [
          AspectRatio(aspectRatio: 1, child: ColoredBox(color: product.color)),
          const SizedBox(width: 24),
           Expanded(child: Text(product.name)),
          const SizedBox(width: 24),
          TextButton(
            onPressed: () {
              shoppingCartController.add(ShoppingCart(catalog: product));
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }
}
