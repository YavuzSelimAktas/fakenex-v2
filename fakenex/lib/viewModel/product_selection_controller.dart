import 'package:get/get.dart';
import 'package:fakenex/model/product_model.dart';

class ProductSelectionController extends GetxController {
  
  var variants = <ProductVariant>[
    ProductVariant(name: 'Laci XL'),
    ProductVariant(name: 'Sarı L'),
    ProductVariant(name: 'Siyah XL'),
    ProductVariant(name: 'Sarı S'),
    ProductVariant(name: 'Beyaz XL'),
    ProductVariant(name: 'Beyaz S'),
    ProductVariant(name: 'Beyaz L'),
    ProductVariant(name: 'Sarı XL'),
    ProductVariant(name: 'Laci S'),
    ProductVariant(name: 'Siyah S'),
  ].obs;

  void incrementQuantity(int index) {
    variants[index].quantity++;
    variants.refresh();
  }

  void decrementQuantity(int index) {
    if (variants[index].quantity > 0) {
      variants[index].quantity--;
      variants.refresh();
    }
  }

  void submitSelection() {
    final selectedItems = variants.where((variant) => variant.quantity > 0).toList();
    Get.back(result: selectedItems); 
  }
}