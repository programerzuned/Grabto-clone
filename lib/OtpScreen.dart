import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < _controllers.length; i++) {
      _controllers[i].addListener(() {
        if (_controllers[i].text.length == 1) {
          if (i < _controllers.length - 1) {
            FocusScope.of(context).requestFocus(_focusNodes[i + 1]);
          } else {
            FocusScope.of(context).unfocus(); // Hide keyboard
          }
        }
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/img_2.png', // Replace with your image asset
              height: 150,
            ),
            SizedBox(height: 20),
            Text(
              'Enter verification code',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Enter the 4 digit number that we sent to 8052476395',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 30),
            _buildOtpInputs(),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Verify',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 30),
            NumberPad(
              onNumberPressed: _onNumberPressed,
              onDeletePressed: _onDeletePressed,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpInputs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(4, (index) {
        return SizedBox(
          width: 60,
          child: TextFormField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.red),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 15),
            ),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
            keyboardType: TextInputType.none, // Disable default keyboard
            readOnly: true, // Make fields read-only to avoid triggering the keyboard
            maxLength: 1,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        );
      }),
    );
  }

  void _onNumberPressed(String number) {
    for (int i = 0; i < _controllers.length; i++) {
      if (_controllers[i].text.isEmpty) {
        setState(() {
          _controllers[i].text = number;
        });
        if (i < _controllers.length - 1) {
          FocusScope.of(context).requestFocus(_focusNodes[i + 1]);
        } else {
          FocusScope.of(context).unfocus(); // Hide keyboard
        }
        break;
      }
    }
  }

  void _onDeletePressed() {
    for (int i = _controllers.length - 1; i >= 0; i--) {
      if (_controllers[i].text.isNotEmpty) {
        setState(() {
          _controllers[i].clear();
        });
        if (i > 0) {
          FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
        } else {
          FocusScope.of(context).unfocus(); // Hide keyboard
        }
        break;
      }
    }
  }
}

class NumberPad extends StatelessWidget {
  final void Function(String) onNumberPressed;
  final VoidCallback onDeletePressed;

  NumberPad({required this.onNumberPressed, required this.onDeletePressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < 3; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int j = 1; j <= 3; j++)
                _buildNumberButton(context, (i * 3 + j).toString()),
            ],
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNumberButton(context, "0"),
            _buildDeleteButton(context),
          ],
        ),
      ],
    );
  }

  Widget _buildNumberButton(BuildContext context, String number) {
    return GestureDetector(
      onTap: () => onNumberPressed(number),
      child: Container(
        margin: EdgeInsets.all(8),
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          number,
          style: TextStyle(fontSize: 24, color: Colors.red),
        ),
      ),
    );
  }

  Widget _buildDeleteButton(BuildContext context) {
    return GestureDetector(
      onTap: onDeletePressed,
      child: Container(
        margin: EdgeInsets.all(8),
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Icon(
          Icons.backspace,
          color: Colors.red,
          size: 24,
        ),
      ),
    );
  }
}
