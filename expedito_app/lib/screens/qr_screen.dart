import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expedito_app/models/planet.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'exoplanet_screen.dart';

import 'package:expedito_app/models/planet.dart';


class QrScreen extends StatefulWidget {
  const QrScreen({super.key});

  @override
  _QrScreenState createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? scanResult;
  bool isCameraOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgrounds/home.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
 Center(
  child: SizedBox(
    width: 300, // Define the width for all children
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          child: const Text(
            'Scan Your Exoplanet Card',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 200,
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
                      top: 80,
                      left: 0,
                      right: 0,
                      child: Image.asset('assets/images/icons/qr_rectangle.png'),
                    ),
                  ],
                ),
        ),
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          child: const Text(
            'Scan to explore and learn fascinating details about this exoplanet',
            style: TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      const SizedBox(height: 30),
            SizedBox(
              width:130,
              child: ElevatedButton(
                onPressed: () {
                  // TODO QR code
                  setState(() {
                    isCameraOpen = true;
                  });
                  Navigator.pushNamed(context, '/exoplanetScreen');

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Scan', style: TextStyle(fontWeight: FontWeight.bold),),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width:130,
              child: ElevatedButton(
                onPressed: () {
                  // TODO Navigate to Leaderboard Screen
                  Navigator.pushNamed(context, '/leaderboard');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Leaderboard', style: TextStyle(fontWeight: FontWeight.bold),),
              ),
            ),
          
      ],
    ),
  ),
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

        try {
          // Transform the scan result to lowercase and replace spaces with dashes
          String transformedResult =
              scanResult!.toLowerCase().replaceAll(' ', '-');

          // Fetch planet data from Firestore using the transformed result
          DocumentSnapshot planetDoc = await FirebaseFirestore.instance
              .collection('Planets')
              .doc(
                  transformedResult) // Use transformedResult instead of scanResult
              .get();

          if (planetDoc.exists) {
            Map<String, dynamic> planetData =
                planetDoc.data() as Map<String, dynamic>;
            // Create a Planet object
            Planet planet = Planet.fromFirestore(planetData);

            // Fetch the image URL
            await planet.fetchImageUrl();

            // Navigate to the ExoplanetScreen with the Planet object
            // Navigator.of(context).pushReplacement(
            //   MaterialPageRoute(
            //     builder: (context) => ExoplanetScreen(planet: planet),
            //   ),
            // );
          } else {
            // Handle case where planet is not found
            _showErrorDialog('Planet not found in the database');
          }
        } catch (e) {
          // Handle any errors that occur during the process
          _showErrorDialog('Error processing planet data: $e');
        }
      }
    });
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              setState(() {
                isCameraOpen = false; // Reset camera state
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
