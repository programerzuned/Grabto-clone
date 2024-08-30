import 'package:demo1/LoginVerify.dart';
import 'package:demo1/SingnUp.dart';
import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  void _onLoginPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginVerify()),
    );
  }

  void _onSignupPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUp()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background color of space
          Container(
            color: const Color(0xFFdb1a21), // Background color
          ),

          // Content in the center
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated floating planet


              Padding(
                padding: const EdgeInsets.only(top: 80), // Adjusted padding
                child: Center(
                  child: AnimatedOpacity(
                    opacity: 1.0,
                    duration: const Duration(seconds: 2),
                    child: Image.asset(
                      'assets/images/img.png',
                      height: 250,
                      width: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // Spacer to push the buttons to the bottom
              const Spacer(),
              // Container for the welcome text and buttons
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                    top: 30.0, bottom: 89, left: 25, right: 25),
                decoration: const BoxDecoration(
                  color: Color(0xff282e3a),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80.0), // Adjust the radius as needed
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            "Welcome",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            "Deals that make your wallet smile!",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity, // Make the button take full width
                      child: ElevatedButton(
                        onPressed: () => _onLoginPressed(context),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color(0xFFdb1a21), // Background color
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 12.0), // Padding inside the button
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0), // Rounded corners
                          ),
                          elevation: 5, // Shadow elevation
                          textStyle: const TextStyle(
                            fontSize: 16, // Font size
                            fontWeight: FontWeight.bold, // Font weight
                          ),
                        ),
                        child: const Text("Login"),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity, // Make the button take full width
                      child: ElevatedButton(
                        onPressed: () => _onSignupPressed(context), // Corrected the function reference
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color(0xFFdb1a21), // Background color
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 12.0), // Padding inside the button
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0), // Rounded corners
                          ),
                          elevation: 5, // Shadow elevation
                          textStyle: const TextStyle(
                            fontSize: 16, // Font size
                            fontWeight: FontWeight.bold, // Font weight
                          ),
                        ),
                        child: const Text("Signup"), // Changed text to "Signup"
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
