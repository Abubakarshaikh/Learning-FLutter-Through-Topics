import 'package:basic_getx/controller/shopping_cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'shopping_cart_tile.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ShoppingCartController controller = Get.put(ShoppingCartController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Shopping Cart"),
      ),
      body: Obx(
        () => ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return ShoppingCartTile(
              onPressed: () =>
                  controller.delete(controller.shoppingCartList[index]),
              shoppingCart: controller.shoppingCartList[index],
            );
          },
          itemCount: controller.shoppingCartList.length,
        ),
      ),
    );
  }
}
