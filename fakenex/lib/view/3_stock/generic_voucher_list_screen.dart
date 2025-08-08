import 'package:flutter/material.dart';
import 'package:fakenex/core/theme/app_themes.dart';

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
                decoration: const InputDecoration(
                  hintText: 'Stok fişlerinde ara',
                  prefixIcon: Icon(Icons.qr_code_scanner),
                  suffixIcon: Icon(Icons.search),
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