import 'package:flutter/material.dart';
import 'package:fakenex/core/theme/app_themes.dart';

class CustomerSelectionScreen extends StatelessWidget {
  final Color themeColor;

  const CustomerSelectionScreen({
    super.key,
    this.themeColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppThemes.buildLightTheme(themeColor),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cari Seçiniz'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person_add_alt_1),
            ),
          ],
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
            const Expanded(
              child: Center(
                child: Text(
                  'Cari seçmek için arama yapın.',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}