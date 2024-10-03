import 'package:flutter/material.dart';

class NumberExoplanets extends StatefulWidget {
  @override
  _NumberExoplanetsState createState() => _NumberExoplanetsState();
}

class _NumberExoplanetsState extends State<NumberExoplanets> {
  final TextEditingController _controller = TextEditingController();
  int _totalExoplanets = 0;
  int _currentExoplanet = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/backgrounds/Planet.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 299,
                  height: 89,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Text(
                    'How many exoplanets did you explore/invade?',
                    style: TextStyle(
                      fontFamily: 'Space Grotesk',
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      height:
                          1.5, // This represents line-height equivalent to 45px/30px
                      color:
                          Colors.black.withOpacity(1.0), // Opacity set to 100%
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter number of exoplanets',
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      setState(() {
                        _totalExoplanets = int.parse(_controller.text);
                        _currentExoplanet = 1; // Reset to first exoplanet
                      });
                      if (_totalExoplanets > 0) {
                        _navigateToScanScreen();
                      }
                    }
                  },
                  child: Text('Start Exploration'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToScanScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScanScreen(
          currentExoplanet: _currentExoplanet,
          onScanCompleted: () {
            setState(() {
              _currentExoplanet++;
            });
            if (_currentExoplanet <= _totalExoplanets) {
              // Delay navigation to avoid a stack overflow
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _navigateToScanScreen();
              });
            } else {
              // Exploration completed
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Exploration Completed!'),
              ));
            }
          },
        ),
      ),
    );
  }
}

class ScanScreen extends StatelessWidget {
  final int currentExoplanet;
  final VoidCallback onScanCompleted;

  const ScanScreen({
    Key? key,
    required this.currentExoplanet,
    required this.onScanCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scanning Exoplanet $currentExoplanet')),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/backgrounds/Planet.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Scanning Exoplanet $currentExoplanet...',
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    onScanCompleted();
                  },
                  child: Text('Scan Complete'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
