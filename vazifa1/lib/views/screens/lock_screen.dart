import 'package:flutter/material.dart';
import 'package:lesson43/utils/app_constants.dart';
import 'package:lesson43/views/screens/home_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LockScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onBackgroundImageChanged;
  final ValueChanged<bool> onPincodeChanged;
  const LockScreen({
    super.key,
    required this.onPincodeChanged,
    required this.onThemeChanged,
    required this.onBackgroundImageChanged,
  });

  @override
  State<StatefulWidget> createState() {
    return _LockScreenState();
  }
}

class _LockScreenState extends State<LockScreen> {
  final TextEditingController _pinController = TextEditingController();
  bool pincodeCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PinCodeTextField(
              appContext: context,
              length: 4,
              controller: _pinController,
              onCompleted: (value) {
                if (value == AppConstants.pincode) {
                  pincodeCheck = false;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(
                          onPincodeChanged: widget.onPincodeChanged,
                          onThemeChanged: widget.onThemeChanged,
                          onBackgroundImageChanged:
                              widget.onBackgroundImageChanged,
                        ),
                      ));
                } else {
                  pincodeCheck = true;
                  setState(() {});
                }
              },
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            pincodeCheck
                ? const Text(
                    "Pincode xato",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
