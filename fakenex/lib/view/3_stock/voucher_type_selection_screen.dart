import 'package:flutter/material.dart';
import 'package:fakenex/core/constants/app_colors.dart';
import 'package:fakenex/core/theme/app_themes.dart';
import 'package:fakenex/view/3_stock/generic_voucher_list_screen.dart';

class VoucherTypeSelectionScreen extends StatelessWidget {
  const VoucherTypeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color themeColor = AppColors.stockVoucher;

    final List<Map<String, dynamic>> voucherTypes = [
      {'title': 'Giriş Fişi', 'icon': Icons.trending_up},
      {'title': 'Çıkış Fişi', 'icon': Icons.trending_down},
      {'title': 'Depolar Arası Sevk Fişi', 'icon': Icons.swap_horiz},
      {'title': 'Araç Yükleme', 'icon': Icons.upload},
      {'title': 'Araç İndirme', 'icon': Icons.download},
      {'title': 'Tüketim Fişi', 'icon': Icons.local_drink},
      {'title': 'Devir Fişi', 'icon': Icons.transform},
      {'title': 'Fire Fişi', 'icon': Icons.whatshot},
      {'title': 'Virman Fişi', 'icon': Icons.sync_alt},
    ];

    return Theme(
      data: AppThemes.buildLightTheme(themeColor).copyWith(
        scaffoldBackgroundColor: Colors.grey.shade100,
        listTileTheme: ListTileThemeData(
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          iconColor: themeColor,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Fiş Türü Seçiniz'),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(16.0),
          itemCount: voucherTypes.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final item = voucherTypes[index];
            return ListTile(
              leading: Icon(item['icon']),
              title: Text(item['title']),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GenericVoucherListScreen(
                      title: item['title'],
                      themeColor: themeColor,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}