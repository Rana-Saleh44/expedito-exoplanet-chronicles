import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'exoplanet_screen.dart'; // Import your HomeScreen


class QrScreen extends StatefulWidget {
  @override
  _ScanExoplanetCardScreenState createState() =>
      _ScanExoplanetCardScreenState();
}

class _ScanExoplanetCardScreenState extends State<QrScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? controller;
  String? scanResult;
  bool isCameraOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgrounds/home.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Scan Your Exoplanet Card',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 20),
            Container(
              height: 200,
              width: 200,
              child: isCameraOpen
                  ? QRView(
                      key: qrKey,
                      onQRViewCreated: _onQRViewCreated,
                      overlay: QrScannerOverlayShape(
                        borderColor: Colors.white,
                        borderRadius: 10,
                        borderLength: 30,
                        borderWidth: 10,
                        cutOutSize: 150,
                      ),
                    )
                  : Stack(
                      children: [
                        Image.asset('assets/images/icons/qr_code.png'),
                        Positioned(
                          top: 80, // Adjust this value to move the image down
                          left: 0,
                          right: 0,
                          child: Image.asset('assets/images/icons/qr_rectangle.png'),
                        ),
                      ],
                    ),
            ),
            SizedBox(height: 20),
            Text(
              'Scan to explore and learn fascinating details about this exoplanet',
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isCameraOpen = true;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Scan'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Leaderboard Screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Leaderboard'),
            ),
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
  this.controller = controller;
  controller.scannedDataStream.listen((scanData) async {
    setState(() {
      scanResult = scanData.code ?? 'No data found';
    });
    
    if (scanResult != null) {
      // Close the QR scanner
      controller.pauseCamera();
      
      // Navigate to the screen that processes the planet data
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ExoplanetScreen(scannedCode: scanResult!),
        ),
      );
    }
  });
}

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}