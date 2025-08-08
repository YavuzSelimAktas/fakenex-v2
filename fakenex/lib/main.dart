import 'package:fakenex/core/services/navigation_service.dart';
import 'package:fakenex/core/theme/app_themes.dart';
import 'package:fakenex/view/0_auth/login_screen.dart'; 
import 'package:get/get.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FakenexApp());
}

class FakenexApp extends StatelessWidget {
  const FakenexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fakenex',
      navigatorKey: NavigationService.navigatorKey,
      theme: AppThemes.darkTheme,
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}