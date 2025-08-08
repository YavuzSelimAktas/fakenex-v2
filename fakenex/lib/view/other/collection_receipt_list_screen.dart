import 'package:flutter/material.dart';
import 'package:fakenex/view/4_customer/customer_selection_screen.dart';

class CollectionReceiptListScreen extends StatefulWidget {
  const CollectionReceiptListScreen({super.key});

  @override
  State<CollectionReceiptListScreen> createState() => _CollectionReceiptListScreenState();
}

class _CollectionReceiptListScreenState extends State<CollectionReceiptListScreen> {
  @override
  Widget build(BuildContext context) {
    final Color themeColor = Colors.indigo.shade700;

    return Theme(
      data: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: themeColor,
          foregroundColor: Colors.white,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: themeColor,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tahsilat Makbuzları'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Tahsilatlarda ara',
                  prefixIcon: const Icon(Icons.qr_code_scanner),
                  suffixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            const Expanded(
              child: Center(
                child: Text(
                  'Henüz tahsilat makbuzu bulunmuyor.',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              heroTag: 'add_receipt', 
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CustomerSelectionScreen(themeColor: themeColor)),
                );
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 16),
            FloatingActionButton(
              heroTag: 'date_receipt',
              onPressed: () {
                
              },
              child: const Icon(Icons.calendar_today),
            ),
          ],
        ),
      ),
    );
  }
}