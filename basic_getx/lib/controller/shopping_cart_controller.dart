import 'package:basic_getx/models/shopping_cart.dart';
import 'package:get/get.dart';

class ShoppingCartController extends GetxController {
  RxList<ShoppingCart> shoppingCartList = RxList<ShoppingCart>();

  void add(ShoppingCart item) {
    shoppingCartList.add(item);
  }

  void delete(ShoppingCart item) {
    shoppingCartList.remove(item);
  }
}
