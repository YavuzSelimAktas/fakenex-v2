import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fakenex/model/product_model.dart';
import 'package:fakenex/viewModel/product_selection_controller.dart';
class ProductSelectionScreen extends StatelessWidget {
  const ProductSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductSelectionController controller = Get.put(ProductSelectionController());

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text('Renk - Beden Seçimi'),
        backgroundColor: const Color(0xFF1F1F1F),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: controller.variants.length,
              itemBuilder: (context, index) {
                return _buildVariantListItem(controller.variants[index], index, controller);
              },
            )),
          ),
          _buildBottomButtons(controller),
        ],
      ),
    );
  }

  Widget _buildVariantListItem(ProductVariant variant, int index, ProductSelectionController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(variant.name, style: const TextStyle(fontSize: 18)),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF1F1F1F),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    controller.decrementQuantity(index);
                  },
                ),
                Column(
                  children: [
                    const Text('Miktar', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    Text(
                      variant.quantity.toStringAsFixed(2),
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    controller.incrementQuantity(index);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons(ProductSelectionController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                Get.back();
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                foregroundColor: Colors.amber,
                side: const BorderSide(color: Colors.amber),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text('İptal'),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                controller.submitSelection();
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text('Onayla'),
            ),
          ),
        ],
      ),
    );
  }
}