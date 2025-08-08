import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF1F1F1F), 
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          
          SizedBox(
            height: 150,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF121212), 
              ),
              child: Center(
                child: Text(
                  'fakenex',
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ),
            ),
          ),
          
          
          _buildExpansionTile(
            context,
            icon: Icons.description,
            iconColor: Colors.cyan,
            title: 'Tanımlar',
            children: [
              _buildSubListItem(title: 'Stok Kartları'),
              _buildSubListItem(title: 'Cari Hesap Kartları'),
            ],
          ),
          _buildExpansionTile(
            context,
            icon: Icons.article,
            iconColor: Colors.yellow.shade700,
            title: 'Fiş',
            children: [
              _buildSubListItem(title: 'Satış Fişi'),
              _buildSubListItem(title: 'Satınalma Fişi'),
              _buildSubListItem(title: 'İade Satış Fişi'),
              _buildSubListItem(title: 'İade Satınalma Fişi'),
            ],
          ),
          _buildExpansionTile(
            context,
            icon: Icons.local_shipping,
            iconColor: Colors.blue,
            title: 'İrsaliye',
             children: [
              _buildSubListItem(title: 'Satış İrsaliyesi'),
              _buildSubListItem(title: 'Satınalma İrsaliyesi'),
              _buildSubListItem(title: 'İade Satış İrsaliyesi'),
              _buildSubListItem(title: 'İade Satınalma İrsaliyesi'),
            ],
          ),
          _buildExpansionTile(
            context,
            icon: Icons.shopping_bag,
            iconColor: Colors.orange,
            title: 'Sipariş',
             children: [
              _buildSubListItem(title: 'Satış Siparişi'),
              _buildSubListItem(title: 'Satınalma Siparişi'),
            ],
          ),
          _buildExpansionTile(
            context,
            icon: Icons.receipt_long,
            iconColor: Colors.green,
            title: 'Fatura',
             children: [
              _buildSubListItem(title: 'Satış Faturası'),
              _buildSubListItem(title: 'Satınalma Faturası'),
              _buildSubListItem(title: 'İade Satış Faturası'),
              _buildSubListItem(title: 'İade Satınalma Faturası'),
            ],
          ),
           _buildExpansionTile(
            context,
            icon: Icons.request_quote,
            iconColor: Colors.amber,
            title: 'Teklifler',
             children: [
              _buildSubListItem(title: 'Satış Teklifi'),
              _buildSubListItem(title: 'Satınalma Teklifi'),
            ],
          ),
           _buildExpansionTile(
            context,
            icon: Icons.point_of_sale,
            iconColor: Colors.purple,
            title: 'Kasa İşlem',
             children: [
              _buildSubListItem(title: 'Kasa Tahsilat'),
              _buildSubListItem(title: 'Kasa Ödeme'),
              _buildSubListItem(title: 'Kasa Masraf'),
            ],
          ),
          _buildExpansionTile(
            context,
            icon: Icons.inventory,
            iconColor: Colors.red.shade400,
            title: 'Stok Fişi',
            children: [
              _buildSubListItem(title: 'Giriş Fişi'),
              _buildSubListItem(title: 'Çıkış Fişi'),
              _buildSubListItem(title: 'Depolar Arası Sevk Fişi'),
              _buildSubListItem(title: 'Araç Yükleme'),
              _buildSubListItem(title: 'Araç İndirme'),
              _buildSubListItem(title: 'Tüketim Fişi'),
              _buildSubListItem(title: 'Devir Fişi'),
              _buildSubListItem(title: 'Fire Fişi'),
              _buildSubListItem(title: 'Virman Fişi'),
            ],
          ),
          _buildExpansionTile(
            context,
            icon: Icons.bar_chart,
            iconColor: Colors.blue.shade300,
            title: 'Raporlar',
            children: [
              _buildSubListItem(title: 'Gün Sonu Raporu'),
              _buildSubListItem(title: 'Ürün Bazlı Satış Raporu'),
              _buildSubListItem(title: 'Tahsilat Raporu'),
              _buildSubListItem(title: 'Stok Hareket Raporu'),
              _buildSubListItem(title: 'Cari Hesap Ekstresi'),
              _buildSubListItem(title: 'Stok Detaylı Cari Hesap Ekstresi'),
            ],
          ),
          
          // Normal menü elemanları
          _buildDrawerItem(icon: Icons.map_outlined, iconColor: Colors.lightGreen, text: 'Rota'),
          _buildDrawerItem(icon: Icons.payment, iconColor: Colors.indigo, text: 'Tahsilat Makbuzları'),
          _buildDrawerItem(icon: Icons.calculate, iconColor: Colors.blueGrey, text: 'Stok Sayım'),
          _buildDrawerItem(icon: Icons.price_change, iconColor: Colors.lightBlue, text: 'Fiyat Değişikliği'),
          const Divider(color: Colors.white24),
          _buildDrawerItem(icon: Icons.settings, iconColor: Colors.grey, text: 'Ayarlar'),
          _buildDrawerItem(icon: Icons.logout, iconColor: Colors.redAccent, text: 'Çıkış'),
        ],
      ),
    );
  }

  
  Widget _buildExpansionTile(BuildContext context, {required IconData icon, required Color iconColor, required String title, required List<Widget> children}) {
    return ExpansionTile(
      leading: Icon(icon, color: iconColor),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      iconColor: Colors.white70,
      collapsedIconColor: Colors.white70,
      children: children,
    );
  }
  
  
  Widget _buildSubListItem({required String title}) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0), 
      child: ListTile(
        title: Text(title, style: TextStyle(color: Colors.white.withOpacity(0.8))),
        onTap: () {
          
          print('$title tıklandı');
        },
      ),
    );
  }

  
  Widget _buildDrawerItem({required IconData icon, required Color iconColor, required String text}) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(text, style: const TextStyle(color: Colors.white)),
      onTap: () {
        
        print('$text tıklandı');
      },
    );
  }
}