import 'package:get/get.dart';
import 'package:fakenex/model/product_model.dart';

class NewDispatchController extends GetxController {
  
  var selectedProducts = <ProductVariant>[].obs;
  void addSelectedProducts(List<ProductVariant> products) {
    selectedProducts.addAll(products);
  }

}