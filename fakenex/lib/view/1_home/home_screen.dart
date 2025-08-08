import 'package:flutter/material.dart';
import 'package:fakenex/view/2_sales/sales_dispatch_screen.dart';
import 'package:fakenex/view/2_sales/sales_order_screen.dart';
import 'package:fakenex/view/3_stock/voucher_type_selection_screen.dart';
import 'package:fakenex/view/2_sales/sales_receipt_screen.dart';
import 'package:fakenex/view/2_sales/sales_invoice_screen.dart';
import 'package:fakenex/view/3_stock/stock_list_screen.dart';
import 'package:fakenex/view/4_customer/customer_account_list_screen.dart';
import 'package:fakenex/view/other/route_list_screen.dart';
import 'package:fakenex/view/other/collection_receipt_list_screen.dart';
import 'package:fakenex/view/3_stock/stock_count_screen.dart'; 
import 'package:fakenex/view/other/cash_collection_screen.dart'; 
import 'package:fakenex/view/other/price_check_screen.dart'; 
import 'package:fakenex/view/5_shared_widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {'title': 'Satış Siparişi', 'icon': Icons.shopping_cart, 'color': Colors.orange, 'target': const SalesOrderScreen()},
      {'title': 'Stok Fişi', 'icon': Icons.shopping_bag, 'color': Colors.red, 'target': const VoucherTypeSelectionScreen()},
      {'title': 'Satış İrsaliyesi', 'icon': Icons.local_shipping, 'color': Colors.blue, 'target': const SalesDispatchScreen()},
      {'title': 'Satış Fişi', 'icon': Icons.receipt, 'color': Colors.yellow.shade700, 'target': const SalesReceiptScreen()},
      {'title': 'Satış Faturası', 'icon': Icons.receipt_long, 'color': Colors.green, 'target': const SalesInvoiceScreen()},
      {'title': 'Stok Kartları', 'icon': Icons.inventory_2, 'color': Colors.teal, 'target': const StockListScreen()},
      {'title': 'Cari Hesap Kartları', 'icon': Icons.people, 'color': Colors.cyan, 'target': const CustomerAccountListScreen()},
      {'title': 'Rota', 'icon': Icons.map, 'color': Colors.lightGreen, 'target': const RouteListScreen()},
      {'title': 'Tahsilat Makbuzları', 'icon': Icons.payment, 'color': Colors.indigo, 'target': const CollectionReceiptListScreen()},
      // !!! DEĞİŞİKLİK BURADA: 'target' anahtarları eklendi !!!
      {'title': 'Stok Sayım', 'icon': Icons.calculate, 'color': Colors.blueGrey, 'target': const StockCountScreen()},
      {'title': 'Kasa Tahsilat', 'icon': Icons.point_of_sale, 'color': Colors.purple, 'target': const CashCollectionScreen()},
      {'title': 'Fiyat Gör', 'icon': Icons.price_check, 'color': Colors.lightBlue, 'target': const PriceCheckScreen()},
    ];

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('fakenex', style: TextStyle(fontFamily: 'monospace', fontSize: 24)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Colors.greenAccent,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                const Text('Online', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, 
            crossAxisSpacing: 8, 
            mainAxisSpacing: 8, 
            childAspectRatio: 0.9, 
          ),
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            final item = menuItems[index];
            return DashboardCard(
              title: item['title'],
              icon: item['icon'],
              color: item['color'],
              onTap: () {
                if (item['target'] != null) {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => item['target']),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${item['title']} sayfası henüz hazır değil.')),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const DashboardCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell( 
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
