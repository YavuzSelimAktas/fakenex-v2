import 'package:flutter/material.dart';
import 'package:fakenex/core/constants/app_colors.dart';
import 'package:fakenex/core/theme/app_themes.dart';
import 'package:fakenex/viewModel/customer_account_controller.dart';
import 'package:get/get.dart';

class CustomerAccountListScreen extends StatelessWidget {
  const CustomerAccountListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color themeColor = AppColors.customerAccounts;
    final CustomerAccountController controller = Get.put(CustomerAccountController());

    return Theme(
      data: AppThemes.buildLightTheme(themeColor),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cari Hesap Listesi'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cari ismi, kodu, barkodu',
                  prefixIcon: const Icon(Icons.qr_code_scanner),
                  suffixIcon: const Icon(Icons.more_vert),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            
            Expanded(
             
              child: Obx(() {
                
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                
                else if (controller.errorMessage.value.isNotEmpty) {
                  return Center(
                    child: Text(
                      controller.errorMessage.value,
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  );
                }
                
                else {
                  return ListView.builder(
                    itemCount: controller.userList.length,
                    itemBuilder: (context, index) {
                      
                      final user = controller.userList[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(user.name[0]), 
                          ),
                          title: Text(user.name),
                          subtitle: Text(user.email),
                        ),
                      );
                    },
                  );
                }
              }),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            
          },
          label: const Text('Cari Ekle'),
          icon: const Icon(Icons.person_add),
        ),
      ),
    );
  }
}
