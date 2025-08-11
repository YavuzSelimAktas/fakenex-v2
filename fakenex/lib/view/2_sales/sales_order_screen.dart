import 'package:flutter/material.dart';
import 'package:fakenex/view/4_customer/customer_selection_screen.dart';
import 'package:fakenex/core/constants/app_colors.dart'; 
import 'package:fakenex/core/theme/app_themes.dart'; 
import 'package:fakenex/view/5_shared_widgets/barcode_scanner_screen.dart';

class SalesOrderScreen extends StatefulWidget {
  const SalesOrderScreen({super.key});

  @override
  State<SalesOrderScreen> createState() => _SalesOrderScreenState();
}

class _SalesOrderScreenState extends State<SalesOrderScreen> {
  int _bottomNavIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color themeColor = AppColors.salesOrder;

    return Theme(
      data: AppThemes.buildLightTheme(themeColor),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Satış Siparişi'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Ürün kodu, barkodu, cari ismi',
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.qr_code_scanner),
                    onPressed: () async {
                      final scannedCode = await Navigator.of(context).push<String>(
                        MaterialPageRoute(builder: (context) => const BarcodeScannerScreen()),
                      );
                      if (scannedCode != null && scannedCode.isNotEmpty) {
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
                  'Henüz sipariş bulunmuyor.',
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