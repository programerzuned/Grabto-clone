import 'package:demo1/LoginScreen.dart';
import 'package:flutter/material.dart';

class SpaceSplashScreen extends StatefulWidget {
  @override
  _SpaceSplashScreenState createState() => _SpaceSplashScreenState();
}

class _SpaceSplashScreenState extends State<SpaceSplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to login screen after 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Loginscreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background color of space
          Container(
            color: Color(0xFFdb1a21), // Corrected the color format
          ),

          // Content in the center
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Spacer(), // Spacer to push the planet image to the center top

              // Animated floating planet
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: AnimatedOpacity(
                  opacity: 1.0,
                  duration: Duration(seconds: 2),
                  child: Image.network(
                    'https://play-lh.googleusercontent.com/ciR8hZOG1jkmVIAqR_iQ8l9wyVOh-LRqsbtXbVZtAT3ZBIDiqJaAfcdI39X9a7jRHEU=w240-h480-rw', // Image of a planet
                  ),
                ),
              ),

              Spacer(), // Spacer to push the loader to the bottom

              // Loading indicator and text
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      strokeWidth: 3.0,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Loading...',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold, // Make the text bold
                        fontFamily: 'Raleway', // Consistent font
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
