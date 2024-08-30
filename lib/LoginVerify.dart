import 'package:flutter/material.dart';

class LoginVerify extends StatefulWidget {
  @override
  State<LoginVerify> createState() => _LoginVerifyState();
}

class _LoginVerifyState extends State<LoginVerify> {
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Background color of space
          Container(
            color: const Color(0xffffffff), // Background color
          ),

          // Content in the center
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: size.height,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Animated floating planet
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.1),
                      child: Center(
                        child: AnimatedOpacity(
                          opacity: 1.0,
                          duration: const Duration(seconds: 2),
                          child: Image.asset(
                            'assets/images/img_1.png',
                            height: size.height * 0.25,
                            width: size.height * 0.25,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    // Spacer to push the buttons to the bottom
                    Spacer(),
                    // Container for the welcome text, text fields, and buttons
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                          top: 10.0, bottom: size.height * 0.1, left: 25, right: 25),
                      decoration: const BoxDecoration(
                        color: Color(0xff282e3a),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(80.0), // Adjust the radius as needed
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  "Login to your account",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Username TextField with Icon
                          TextField(
                            controller: _usernameController,
                            style: const TextStyle(color: Colors.white),
                            keyboardType: TextInputType.number,
                            maxLength: 10, // Limiting input to 10 characters
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.smartphone_sharp, // Icon for the text field
                                color: Colors.white54,
                              ),
                              hintText: 'Mobile Number',
                              hintStyle: const TextStyle(color: Colors.white54),
                              filled: true,
                              fillColor: const Color(0xFF424c59), // Background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 20.0),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Login Button
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () => _onLoginPressed(context),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: const Color(0xFFdb1a21), // Background color
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 12.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0), // Rounded corners
                                ),
                                elevation: 5, // Shadow elevation
                                textStyle: const TextStyle(
                                  fontSize: 16, // Font size
                                  fontWeight: FontWeight.bold, // Font weight
                                ),
                              ),
                              child: const Text("  Login  "),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onLoginPressed(BuildContext context) {
    final username = _usernameController.text;

    if (username.length == 10 && RegExp(r'^[0-9]+$').hasMatch(username)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login successful for $username'),
          backgroundColor: Colors.green, // Green for successful login
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please enter a valid 10-digit mobile number.'),
          backgroundColor: Color(0xFFdb1a21), // Red for invalid input
        ),
      );
    }
  }
}
