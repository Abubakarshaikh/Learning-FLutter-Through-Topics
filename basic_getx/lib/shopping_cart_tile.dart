import 'package:flutter/material.dart';
import 'package:basic_getx/models/shopping_cart.dart';
class ShoppingCartTile extends StatelessWidget {
  final ShoppingCart shoppingCart;
  final Function() onPressed;
  const ShoppingCartTile({
    Key? key,
    required this.shoppingCart,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 48,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: shoppingCart.catalog.color,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: 24),
          Expanded(child: Text(shoppingCart.catalog.name)),
          const SizedBox(width: 24),
          TextButton(
            onPressed: onPressed,
            child: const Text("remove"),
          ),
        ],
      ),
    );
  }
}
