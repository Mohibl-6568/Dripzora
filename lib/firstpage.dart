import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use Stack to put background image and text/button on top
      body: Stack(
        children: [
          // Background image full screen
          SizedBox.expand(
            child: Image.asset(
              'assets/images/img.jpg', // path from pubspec.yaml
              fit: BoxFit.cover,
            ),
          ),
          // Overlay to darken background a bit (optional)
          Container(color: Colors.black.withOpacity(0.3)),
          // Content on top (slogan + button)
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Slogan at the top
                  Text(
                    'Wear Your Story, Shop Your Style.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 4,
                          color: Colors.black54,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  // Button at the bottom
                  ElevatedButton.icon(
                    onPressed: () {
                      // Navigate or do something on button press
                      // For now just print:
                      print('Get Started pressed');
                    },
                    icon: Icon(Icons.arrow_forward),
                    label: Text('Get Started'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      textStyle: TextStyle(fontSize: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      elevation: 5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
