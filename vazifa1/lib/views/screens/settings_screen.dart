import 'package:flutter/material.dart';
import 'package:lesson43/utils/app_constants.dart';
import 'package:lesson43/views/screens/change_pasword_screen.dart';
import 'package:lesson43/views/widgets/custom_drawer.dart';

class SettingsScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onBackgroundImageChanged;
  final ValueChanged<bool> onPincodeChanged;
  const SettingsScreen({
    super.key,
    required this.onPincodeChanged,
    required this.onThemeChanged,
    required this.onBackgroundImageChanged,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final imageController = TextEditingController();
  final _textColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.black,
  ];
  final _interfeysColors = [
    Colors.amber,
    Colors.purple,
    Colors.blue[900],
  ];
  int _checkTextColor = 3;
  int _checkInterfeysColor = 0;

  @override
  void dispose() {
    imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.interfeysColor,
        title: Text(
          "Sozlamalar",
          style: TextStyle(
              fontSize: AppConstants.textSize, color: AppConstants.textColor),
        ),
        actions: [
          DropdownButton(
            borderRadius: BorderRadius.circular(20),
            dropdownColor: AppConstants.interfeysColor,
            menuMaxHeight: 200,
            isDense: true,
            value: AppConstants.checkLanguage,
            items: [
              DropdownMenuItem(
                value: 0,
                child: Text(
                  "Uz",
                  style: TextStyle(
                      fontSize: AppConstants.textSize,
                      color: AppConstants.textColor),
                ),
              ),
              DropdownMenuItem(
                value: 1,
                child: Text(
                  "Eng",
                  style: TextStyle(
                      fontSize: AppConstants.textSize,
                      color: AppConstants.textColor),
                ),
              ),
              DropdownMenuItem(
                value: 2,
                child: Text(
                  "Ru",
                  style: TextStyle(
                      fontSize: AppConstants.textSize,
                      color: AppConstants.textColor),
                ),
              ),
            ],
            onChanged: (value) {
              setState(() {
                AppConstants.checkLanguage = value!;
              });
            },
          ),
          IconButton(
            onPressed: () {
              String imageUrl = imageController.text;
              imageController.clear();
              widget.onBackgroundImageChanged(imageUrl);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      drawer: CustomDrawer(
        onPincodeChanged: widget.onPincodeChanged,
        onThemeChanged: widget.onThemeChanged,
        onBackgroundImageChanged: widget.onBackgroundImageChanged,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: AppConstants.backgroundImageUrl.isEmpty
              ? null
              : DecorationImage(
                  image: NetworkImage(AppConstants.backgroundImageUrl),
                ),
        ),
        child: ListView(
          children: [
            SwitchListTile(
              value: AppConstants.themeMode == ThemeMode.dark,
              onChanged: widget.onThemeChanged,
              title: Text(
                "Tungi holat",
                style: TextStyle(
                    fontSize: AppConstants.textSize,
                    color: AppConstants.textColor),
              ),
            ),
            TextField(
              controller: imageController,
            ),
            SwitchListTile(
              value: AppConstants.checkPincode == false,
              onChanged: widget.onPincodeChanged,
              title: Text(
                "Pincode on/off",
                style: TextStyle(
                    fontSize: AppConstants.textSize,
                    color: AppConstants.textColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangePaswordScreen(
                              onPincodeChanged: widget.onPincodeChanged,
                              onThemeChanged: widget.onThemeChanged,
                              onBackgroundImageChanged:
                                  widget.onBackgroundImageChanged),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 18, 90, 20)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Change Password",
                      style: TextStyle(
                          fontSize: AppConstants.textSize,
                          fontWeight: FontWeight.bold,
                          color: AppConstants.textColor),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    'Text hajmini tanlang hozirgi holat: ${AppConstants.textSize}',
                    style: TextStyle(
                        fontSize: AppConstants.textSize,
                        color: AppConstants.textColor),
                  ),
                  Slider(
                    value: AppConstants.textSize,
                    min: 14,
                    max: 30,
                    divisions: 16,
                    label: AppConstants.textSize.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        AppConstants.textSize = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Text Rangini tanlang: ',
                    style: TextStyle(
                        fontSize: AppConstants.textSize,
                        color: AppConstants.textColor),
                  ),
                  DropdownButton(
                    borderRadius: BorderRadius.circular(20),
                    dropdownColor: AppConstants.interfeysColor,
                    menuMaxHeight: 200,
                    isDense: true,
                    value: _checkTextColor,
                    items: [
                      DropdownMenuItem(
                        value: 0,
                        child: Text(
                          "Qizil",
                          style: TextStyle(
                              fontSize: AppConstants.textSize,
                              color: AppConstants.textColor),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 1,
                        child: Text(
                          "Havorang",
                          style: TextStyle(
                              fontSize: AppConstants.textSize,
                              color: AppConstants.textColor),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 2,
                        child: Text(
                          "Yashil",
                          style: TextStyle(
                              fontSize: AppConstants.textSize,
                              color: AppConstants.textColor),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 3,
                        child: Text(
                          "Qora",
                          style: TextStyle(
                              fontSize: AppConstants.textSize,
                              color: AppConstants.textColor),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      _checkTextColor = value!;
                      setState(() {
                        AppConstants.textColor = _textColors[_checkTextColor];
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Interfeys Rangini tanlang: ',
                    style: TextStyle(
                        fontSize: AppConstants.textSize,
                        color: AppConstants.textColor),
                  ),
                  DropdownButton(
                    borderRadius: BorderRadius.circular(20),
                    dropdownColor: AppConstants.interfeysColor,
                    menuMaxHeight: 200,
                    isDense: true,
                    value: _checkInterfeysColor,
                    items: [
                      DropdownMenuItem(
                        value: 0,
                        child: Text(
                          "Amber",
                          style: TextStyle(
                              fontSize: AppConstants.textSize,
                              color: AppConstants.textColor),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 1,
                        child: Text(
                          "Siyohrang",
                          style: TextStyle(
                              fontSize: AppConstants.textSize,
                              color: AppConstants.textColor),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 2,
                        child: Text(
                          "Ko'k",
                          style: TextStyle(
                              fontSize: AppConstants.textSize,
                              color: AppConstants.textColor),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      _checkInterfeysColor = value!;
                      setState(() {
                        AppConstants.interfeysColor =
                            _interfeysColors[_checkInterfeysColor]!;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
