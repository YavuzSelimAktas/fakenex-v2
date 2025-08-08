import 'package:flutter/material.dart';
import 'package:fakenex/core/constants/app_colors.dart';
import 'package:fakenex/core/theme/app_themes.dart';

class StockCountScreen extends StatelessWidget {
  const StockCountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color themeColor = AppColors.stockCount;

    return Theme(
      data: AppThemes.buildLightTheme(themeColor),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Stok Sayım'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Stok sayımlarda ara',
                  prefixIcon: const Icon(Icons.qr_code_scanner),
                  suffixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            const Expanded(
              child: Center(
                child: Text(
                  'Henüz sayım bulunmuyor.',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // TODO: Yeni sayım ekleme ekranına yönlendirme
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
