import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fakenex/model/product_model.dart';
import 'package:fakenex/view/5_shared_widgets/product_selection_screen.dart';
import 'package:fakenex/viewModel/new_dispatch_controller.dart';

class NewDispatchScreen extends StatelessWidget {
  const NewDispatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NewDispatchController controller = Get.put(NewDispatchController());

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text('Yeni Satış İrsaliyesi'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'KAYDET',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: const Color(0xFF1F1F1F),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Cari Bilgileri', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Cari ara veya seç...',
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: const Icon(Icons.person_add_alt_1),
                        filled: true,
                        fillColor: const Color(0xFF121212),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              color: const Color(0xFF1F1F1F),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Ürünler', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ElevatedButton.icon(
                          onPressed: () async {
                            final result = await Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => const ProductSelectionScreen()),
                            );

                            if (result != null && result is List<ProductVariant>) {
                              controller.addSelectedProducts(result);
                            }
                          },
                          icon: const Icon(Icons.add),
                          label: const Text('Ürün Ekle'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Obx(() {
                      if (controller.selectedProducts.isEmpty) {
                        return const SizedBox(
                          height: 200,
                          child: Center(
                            child: Text(
                              'Henüz ürün eklenmedi.',
                              style: TextStyle(color: Colors.white60),
                            ),
                          ),
                        );
                      }
                      return ListView.builder(
                        shrinkWrap: true, 
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.selectedProducts.length,
                        itemBuilder: (context, index) {
                          final product = controller.selectedProducts[index];
                          return ListTile(
                            title: Text(product.name),
                            trailing: Text('Miktar: ${product.quantity.toStringAsFixed(0)}'),
                          );
                        },
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
