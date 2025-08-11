import 'package:flutter/material.dart';
import 'package:fakenex/core/theme/app_themes.dart';
import 'package:fakenex/view/5_shared_widgets/barcode_scanner_screen.dart';

class CustomerSelectionScreen extends StatefulWidget {
  final Color themeColor;

  const CustomerSelectionScreen({
    super.key,
    this.themeColor = Colors.grey,
  });

  @override
  State<CustomerSelectionScreen> createState() => _CustomerSelectionScreenState();
}

class _CustomerSelectionScreenState extends State<CustomerSelectionScreen> {
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
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Cari ismi, kodu, barkodu',
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