import 'package:flutter/material.dart';
import 'package:fakenex/core/constants/app_colors.dart';
import 'package:fakenex/core/theme/app_themes.dart';
import 'package:fakenex/view/4_customer/customer_selection_screen.dart';

class SalesReceiptScreen extends StatefulWidget {
  const SalesReceiptScreen({super.key});

  @override
  State<SalesReceiptScreen> createState() => _SalesReceiptScreenState();
}

class _SalesReceiptScreenState extends State<SalesReceiptScreen> {
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    const Color themeColor = AppColors.salesReceipt;

    return Theme(
      data: AppThemes.buildLightTheme(themeColor),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Satış Fişi'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Ürün kodu, barkodu, cari ismi',
                  prefixIcon: const Icon(Icons.qr_code_scanner),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            const Expanded(
              child: Center(
                child: Text(
                  'Henüz fiş bulunmuyor.',
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