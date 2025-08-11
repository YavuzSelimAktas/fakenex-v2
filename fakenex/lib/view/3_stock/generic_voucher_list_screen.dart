import 'package:flutter/material.dart';
import 'package:fakenex/core/theme/app_themes.dart';
import 'package:fakenex/view/5_shared_widgets/barcode_scanner_screen.dart';

class GenericVoucherListScreen extends StatefulWidget {
  final String title;
  final Color themeColor;

  const GenericVoucherListScreen({
    super.key,
    required this.title,
    required this.themeColor,
  });

  @override
  State<GenericVoucherListScreen> createState() => _GenericVoucherListScreenState();
}

class _GenericVoucherListScreenState extends State<GenericVoucherListScreen> {
  int _bottomNavIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppThemes.buildLightTheme(widget.themeColor),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Stok fişlerinde ara',
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
                  suffixIcon: const Icon(Icons.search),
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
            // TODO: Yeni fiş ekleme ekranına yönlendirme
          },
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _bottomNavIndex,
          onTap: (index) {
            setState(() {
              _bottomNavIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Tümü',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              label: 'Aktarılmamış',
            ),
          ],
        ),
      ),
    );
  }
}