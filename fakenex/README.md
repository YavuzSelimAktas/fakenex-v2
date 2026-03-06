# Fakenex - Mobil ERP Uygulaması / Mobile ERP Application

> 🇹🇷 Türkçe açıklama aşağıda | 🇬🇧 English description below

---

## 🇹🇷 Türkçe

### 📋 Proje Hakkında

**Fakenex**, küçük ve orta ölçekli işletmelere yönelik geliştirilmiş bir **mobil ERP (Kurumsal Kaynak Planlama)** uygulamasıdır. Satış operasyonları, stok yönetimi, müşteri hesapları ve çeşitli ticari belgelerin (sipariş, irsaliye, fatura, fiş vb.) yönetimini tek bir platformda sunar.

### ✨ Özellikler

| Modül | Açıklama |
|-------|----------|
| 🔐 **Giriş** | Kullanıcı adı ve şifre ile giriş, "Beni Hatırla" desteği |
| 🏠 **Ana Sayfa** | Renk kodlu 13 modüllü ızgara menü, çevrimiçi durum göstergesi |
| 🛒 **Satış İşlemleri** | Satış siparişi, satış irsaliyesi, satış fişi, satış faturası, yeni irsaliye oluşturma |
| 📦 **Stok Yönetimi** | Fiş tipi seçimi, stok listesi, genel fiş yönetimi, stok sayımı |
| 👥 **Müşteri Hesapları** | Müşteri listesi görüntüleme, müşteri seçimi |
| 📷 **Barkod Tarama** | Mobil kamera ile barkod/QR kod okuma |
| 🔀 **Ürün Seçimi** | Ürün varyantları ve miktar yönetimi |
| 🗂️ **Diğer** | Rut listesi, tahsilat makbuzu, kasa tahsilatı, fiyat sorgulama |

### 🏗️ Mimari

Proje **MVVM (Model-View-ViewModel)** mimarisi ile geliştirilmiştir:

```
lib/
├── main.dart                  # Uygulama giriş noktası
├── core/
│   ├── constants/             # Renk sabitleri (app_colors.dart)
│   ├── services/              # API servisi, navigasyon servisi
│   └── theme/                 # Koyu/açık tema tanımları
├── model/
│   ├── product_model.dart     # Ürün varyant modeli
│   └── user_model.dart        # Kullanıcı modeli
├── view/
│   ├── 0_auth/                # Giriş ekranı
│   ├── 1_home/                # Ana sayfa
│   ├── 2_sales/               # Satış ekranları (5 ekran)
│   ├── 3_stock/               # Stok ekranları (4 ekran)
│   ├── 4_customer/            # Müşteri ekranları (2 ekran)
│   ├── 5_shared_widgets/      # Ortak widget'lar (çekmece, barkod, ürün seçimi)
│   └── other/                 # Diğer ekranlar (4 ekran)
└── viewModel/
    ├── login_controller.dart
    ├── product_selection_controller.dart
    ├── new_dispatch_controller.dart
    └── customer_account_controller.dart
```

### 🔧 Kullanılan Teknolojiler

| Teknoloji | Sürüm | Amaç |
|-----------|--------|------|
| Flutter | SDK ^3.8.1 | Cross-platform UI framework |
| Dart | - | Programlama dili |
| GetX | ^4.7.2 | Durum yönetimi ve navigasyon |
| Dio | ^5.9.0 | HTTP istemcisi / API çağrıları |
| http | ^1.4.0 | HTTP desteği |
| mobile_scanner | ^7.0.1 | Barkod/QR kod tarama |

### 📱 Ekran Akışı

```
Giriş Ekranı
    └── Ana Sayfa (Dashboard)
          ├── Satış Siparişi → Müşteri Seçimi → Ürün Seçimi
          ├── Satış İrsaliyesi
          ├── Satış Fişi
          ├── Satış Faturası
          ├── Fiş Tipi Seçimi → Stok Sayımı
          ├── Stok Listesi
          ├── Müşteri Hesap Listesi
          ├── Rut Listesi
          ├── Tahsilat Makbuzu
          ├── Kasa Tahsilatı
          ├── Fiyat Sorgu
          └── Çekmece Menü (genişletilmiş navigasyon)
```

### 🚀 Kurulum

```bash
# Depoyu klonlayın
git clone https://github.com/YavuzSelimAktas/fakenex-v2.git

# Proje dizinine gidin
cd fakenex-v2/fakenex

# Bağımlılıkları yükleyin
flutter pub get

# Uygulamayı çalıştırın
flutter run
```

### ⚙️ Gereksinimler

- Flutter SDK 3.8.1 veya üzeri
- Dart SDK
- Android Studio / VS Code
- Android: minSdkVersion (Flutter varsayılan), Java 11
- iOS: Xcode (macOS gerektirir)

---

## 🇬🇧 English

### 📋 About the Project

**Fakenex** is a **mobile ERP (Enterprise Resource Planning)** application designed for small and medium-sized businesses. It provides management of sales operations, inventory control, customer accounts, and various commercial documents (orders, dispatches, invoices, receipts, etc.) in a single platform.

### ✨ Features

| Module | Description |
|--------|-------------|
| 🔐 **Login** | Username & password authentication with "Remember Me" support |
| 🏠 **Home** | Color-coded 13-module grid menu with online status indicator |
| 🛒 **Sales** | Sales orders, dispatch notes, receipts, invoices, new dispatch creation |
| 📦 **Stock** | Voucher type selection, stock list, generic voucher management, stock counting |
| 👥 **Customers** | Customer account list, customer selection |
| 📷 **Barcode Scanner** | Mobile camera barcode/QR code scanning |
| 🔀 **Product Selection** | Product variants with quantity management |
| 🗂️ **Others** | Route list, collection receipts, cash collection, price check |

### 🏗️ Architecture

The project follows the **MVVM (Model-View-ViewModel)** architecture pattern:

```
lib/
├── main.dart                  # App entry point
├── core/
│   ├── constants/             # Color constants (app_colors.dart)
│   ├── services/              # API service, navigation service
│   └── theme/                 # Dark/light theme definitions
├── model/
│   ├── product_model.dart     # Product variant model
│   └── user_model.dart        # User model
├── view/
│   ├── 0_auth/                # Login screen
│   ├── 1_home/                # Home dashboard
│   ├── 2_sales/               # Sales screens (5 screens)
│   ├── 3_stock/               # Stock screens (4 screens)
│   ├── 4_customer/            # Customer screens (2 screens)
│   ├── 5_shared_widgets/      # Shared widgets (drawer, barcode, product selection)
│   └── other/                 # Other screens (4 screens)
└── viewModel/
    ├── login_controller.dart
    ├── product_selection_controller.dart
    ├── new_dispatch_controller.dart
    └── customer_account_controller.dart
```

### 🔧 Tech Stack

| Technology | Version | Purpose |
|------------|---------|---------|
| Flutter | SDK ^3.8.1 | Cross-platform UI framework |
| Dart | - | Programming language |
| GetX | ^4.7.2 | State management & navigation |
| Dio | ^5.9.0 | HTTP client / API calls |
| http | ^1.4.0 | HTTP support |
| mobile_scanner | ^7.0.1 | Barcode/QR code scanning |

### 📱 Screen Flow

```
Login Screen
    └── Home Screen (Dashboard)
          ├── Sales Order → Customer Selection → Product Selection
          ├── Sales Dispatch
          ├── Sales Receipt
          ├── Sales Invoice
          ├── Voucher Type Selection → Stock Count
          ├── Stock List
          ├── Customer Account List
          ├── Route List
          ├── Collection Receipt
          ├── Cash Collection
          ├── Price Check
          └── App Drawer (extended navigation)
```

### 🚀 Getting Started

```bash
# Clone the repository
git clone https://github.com/YavuzSelimAktas/fakenex-v2.git

# Navigate to the project directory
cd fakenex-v2/fakenex

# Install dependencies
flutter pub get

# Run the application
flutter run
```

### ⚙️ Requirements

- Flutter SDK 3.8.1 or higher
- Dart SDK
- Android Studio / VS Code
- Android: minSdkVersion (Flutter default), Java 11
- iOS: Xcode (macOS required)

---

### 🎨 Theme

The app features a **dark theme** by default with module-specific color coding:

| Module | Color |
|--------|-------|
| Sales Order | 🟠 Orange |
| Sales Dispatch | 🔵 Blue |
| Sales Receipt | 🟡 Amber |
| Sales Invoice | 🟢 Green |
| Stock | 🔴 Red |
| Customer Account | light Blue |

### 📄 License

This project is private and not published on pub.dev.
