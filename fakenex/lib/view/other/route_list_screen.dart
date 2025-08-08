import 'package:flutter/material.dart';
import 'package:fakenex/core/constants/app_colors.dart';
import 'package:fakenex/core/theme/app_themes.dart';
import 'dart:math';

class RouteListScreen extends StatelessWidget {
  const RouteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color themeColor = AppColors.route;

    return Theme(
      data: AppThemes.buildLightTheme(themeColor),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Rota Listesi'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: Center(
          child: CustomPaint(
            size: Size(MediaQuery.of(context).size.width * 0.7, MediaQuery.of(context).size.width * 0.7),
            painter: CirclePainter(color: themeColor),
            child: const Center(
              child: Text(
                'Rota Bilgisi Bulunamadı',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final Color color;
  CirclePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;
    
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}