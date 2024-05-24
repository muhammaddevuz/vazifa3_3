import 'package:flutter/material.dart';
import 'package:lesson43/utils/app_constants.dart';
import 'package:lesson43/views/screens/settings_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ChangePaswordScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onBackgroundImageChanged;
  final ValueChanged<bool> onPincodeChanged;
  const ChangePaswordScreen({
    super.key,
    required this.onPincodeChanged,
    required this.onThemeChanged,
    required this.onBackgroundImageChanged,
  });

  @override
  State<StatefulWidget> createState() {
    return _ChangePaswordScreenState();
  }
}

class _ChangePaswordScreenState extends State<ChangePaswordScreen> {
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _pinController2 = TextEditingController();
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
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
              ),
              keyboardType: TextInputType.number,
            ),
            PinCodeTextField(
              appContext: context,
              length: 4,
              controller: _pinController2,
              onCompleted: (value) {
                pincodeCheck = false;
                if (_pinController.text == _pinController2.text) {
                  AppConstants.pincode = _pinController.text;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsScreen(
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
                    "Pincode larni bir xil kiriting",
                    style: TextStyle(
                        fontSize: 30,
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
