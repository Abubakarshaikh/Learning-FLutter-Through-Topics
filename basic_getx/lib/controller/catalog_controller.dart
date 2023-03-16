import 'package:get/get.dart';
import '../models/product.dart';

class CatalogController extends GetxController {
  RxList<Product> catalogList = RxList<Product>();

  void loadCatalog() {
    catalogList.assignAll(Product.items);
  }
}
