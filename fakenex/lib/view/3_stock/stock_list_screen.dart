import 'package:flutter/material.dart';
import 'package:fakenex/core/constants/app_colors.dart';
import 'package:fakenex/core/theme/app_themes.dart';

class StockListScreen extends StatelessWidget {
  const StockListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color themeColor = AppColors.stockCards;

    void _showErrorDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text(
              'Yeni Stok Kodu Başlangıç Değeri tanımlanmamış. Lütfen exe\'den tanımlayınız',
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: themeColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Tamam'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          );
        },
      );
    }

    return Theme(
      data: AppThemes.buildLightTheme(themeColor),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Stok Listesi'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.apps),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Stok ismi, kodu, barkodu',
                  prefixIcon: const Icon(Icons.qr_code_scanner),
                  suffixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            const Expanded(
              child: Center(
                child: Text(
                  'Henüz stok bulunmuyor.',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _showErrorDialog(context);
          },
          label: const Text('Stok Ekle'),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}