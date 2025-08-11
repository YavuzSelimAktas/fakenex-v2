// sales_dispatch_screen.dart dosyasının GÜNCELLENMİŞ hali

import 'package:flutter/material.dart';
import 'package:fakenex/core/constants/app_colors.dart';
import 'package:fakenex/core/theme/app_themes.dart';
import 'package:fakenex/view/4_customer/customer_selection_screen.dart';
// Yeni oluşturduğumuz scanner ekranını import ediyoruz
import 'package:fakenex/view/5_shared_widgets/barcode_scanner_screen.dart'; 

class SalesDispatchScreen extends StatefulWidget {
  const SalesDispatchScreen({super.key});

  @override
  State<SalesDispatchScreen> createState() => _SalesDispatchScreenState();
}

class _SalesDispatchScreenState extends State<SalesDispatchScreen> {
  int _bottomNavIndex = 0;
  // TextField'ı yönetmek için bir controller ekliyoruz
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color themeColor = AppColors.salesDispatch;

    return Theme(
      data: AppThemes.buildLightTheme(themeColor),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Satış İrsaliyesi'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              child: TextField(
                // Controller'ı TextField'a bağlıyoruz
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Ürün kodu, barkodu, cari ismi',
                  // İkonu tıklanabilir bir butona çeviriyoruz
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.qr_code_scanner),
                    onPressed: () async {
                      // Scanner ekranını aç ve sonucu bekle
                      final scannedCode = await Navigator.of(context).push<String>(
                        MaterialPageRoute(builder: (context) => const BarcodeScannerScreen()),
                      );

                      // Eğer bir kod okunduysa (kullanıcı ekranı geri tuşuyla kapatmadıysa)
                      if (scannedCode != null && scannedCode.isNotEmpty) {
                        // Controller aracılığıyla TextField'ın metnini güncelle
                        _searchController.text = scannedCode;
                      }
                    },
                  ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            const Expanded(
              child: Center(
                child: Text(
                  'Henüz irsaliye bulunmuyor.',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CustomerSelectionScreen(themeColor: themeColor)),
            );
          },
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _bottomNavIndex,
          onTap: (index) => setState(() => _bottomNavIndex = index),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Tümü'),
            BottomNavigationBarItem(icon: Icon(Icons.info_outline), label: 'Aktarılmamış'),
          ],
        ),
      ),
    );
  }
}