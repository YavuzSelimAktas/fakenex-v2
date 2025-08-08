import 'package:flutter/material.dart';
import 'package:fakenex/core/constants/app_colors.dart';
import 'package:fakenex/core/theme/app_themes.dart';

class PriceCheckScreen extends StatefulWidget {
  const PriceCheckScreen({super.key});

  @override
  State<PriceCheckScreen> createState() => _PriceCheckScreenState();
}

class _PriceCheckScreenState extends State<PriceCheckScreen> {
  @override
  Widget build(BuildContext context) {
    const Color themeColor = AppColors.priceCheck;

    return Theme(
      data: AppThemes.buildLightTheme(themeColor).copyWith(
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey.shade200,
          elevation: 4,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Fiyat Gör'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Ürün kodu, barkodu, ismi',
                  prefixIcon: const Icon(Icons.qr_code_scanner),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.grid_on, color: Colors.grey.shade600),
                      const SizedBox(width: 8),
                      const Icon(Icons.search),
                      const SizedBox(width: 8),
                    ],
                  ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    'Ürün bilgisi için arama yapın.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.grey.shade700,
          child: const Icon(Icons.qr_code_scanner_outlined, size: 30),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildPriceTypeButton('1'),
              _buildPriceTypeButton('2'),
              const SizedBox(width: 40),
              _buildPriceTypeButton('3'),
              _buildPriceTypeButton('4'),
              _buildPriceTypeButton('5'),
              _buildPriceTypeButton('A'),
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPriceTypeButton(String text) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}