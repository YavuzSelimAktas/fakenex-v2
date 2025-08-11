import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodeScannerScreen extends StatefulWidget {
  const BarcodeScannerScreen({super.key});

  @override
  State<BarcodeScannerScreen> createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  final MobileScannerController _scannerController = MobileScannerController(
    facing: CameraFacing.back,
  );
  String? _scannedCode;
  bool _isProcessing = false;
  
  // DEĞİŞİKLİK 1: Flaşı yönetmek için kendi durum değişkenimizi ekliyoruz.
  bool _isTorchOn = false;

  @override
  void dispose() {
    _scannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barkod Okuyucu'),
        actions: [
          // Kamera değiştirme butonu (ön/arka)
          IconButton(
            onPressed: () => _scannerController.switchCamera(),
            icon: const Icon(Icons.cameraswitch_outlined),
          ),
          // DEĞİŞİKLİK 2: Flaşı açma/kapama butonu tamamen güncellendi.
          IconButton(
            onPressed: () {
              // Önce controller'daki flaşı aç/kapa
              _scannerController.toggleTorch();
              // Sonra ikonun durumunu güncellemek için kendi değişkenimizi değiştir
              setState(() {
                _isTorchOn = !_isTorchOn;
              });
            },
            icon: Icon(
              // İkonu kendi değişkenimize göre belirliyoruz
              _isTorchOn ? Icons.flash_on : Icons.flash_off,
              // Rengi de kendi değişkenimize göre ayarlıyoruz
              color: _isTorchOn ? Colors.yellow : Colors.grey,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: _scannerController,
            onDetect: (capture) {
              if (_isProcessing) return;

              final String? code = capture.barcodes.first.rawValue;
              if (code != null) {
                setState(() {
                  _isProcessing = true;
                  _scannedCode = code;
                });
                Future.delayed(const Duration(milliseconds: 500), () {
                  if (mounted) {
                    Navigator.of(context).pop(_scannedCode);
                  }
                });
              }
            },
          ),
          _buildScannerOverlay(),
          if (_scannedCode != null) _buildScannedResult(),
        ],
      ),
    );
  }

  Widget _buildScannerOverlay() {
    return Container(
      decoration: ShapeDecoration(
        shape: _ScannerOverlayShape(
          borderColor: Colors.blue,
          borderWidth: 4.0,
          cutOutSize: MediaQuery.of(context).size.width * 0.7,
        ),
      ),
      child: Center(
        child: Text(
          'Barkodu çerçevenin içine getirin',
          style: TextStyle(
            backgroundColor: Colors.black.withOpacity(0.5),
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildScannedResult() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Okunan Kod:',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              _scannedCode!,
              style: const TextStyle(color: Colors.lightBlueAccent, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _ScannerOverlayShape extends ShapeBorder {
  final Color borderColor;
  final double borderWidth;
  final double cutOutSize;

  _ScannerOverlayShape({
    this.borderColor = Colors.blue,
    this.borderWidth = 3.0,
    this.cutOutSize = 250,
  });

  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsets.all(10.0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRect(rect);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..addRRect(RRect.fromRectAndCorners(rect))
      ..addRect(Rect.fromCenter(
        center: rect.center,
        width: cutOutSize,
        height: cutOutSize,
      ))
      ..fillType = PathFillType.evenOdd;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final Paint paint = Paint()
      ..color = borderColor
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;
    
    final RRect rrect = RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: rect.center,
          width: cutOutSize,
          height: cutOutSize,
        ),
        const Radius.circular(12));
    
    canvas.drawRRect(rrect, paint);
  }

  @override
  ShapeBorder scale(double t) => this;
}