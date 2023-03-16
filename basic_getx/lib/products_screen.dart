import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'product_list.dart';
import 'controller/shopping_cart_controller.dart';
import 'shopping_cart_screen.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ShoppingCartController shoppingCartController =
        Get.put(ShoppingCartController());

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: IconButton(
              onPressed: () => Get.to(() => const ShoppingCartScreen(),
                  arguments: shoppingCartController),
              icon: badges.Badge(
                badgeContent: Obx(
                  () => Text(
                    '${shoppingCartController.shoppingCartList.length}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                child: const Icon(Icons.shopping_cart),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.green,
        title: const Text("Products"),
      ),
      body: const ProductList(),
    );
  }
}
