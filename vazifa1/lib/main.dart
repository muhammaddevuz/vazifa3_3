import 'package:flutter/material.dart';
import 'package:lesson43/utils/app_constants.dart';
import 'package:lesson43/views/screens/home_screen.dart';
import 'package:lesson43/views/screens/lock_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void toggleThemeMode(bool value) {
    AppConstants.themeMode = value ? ThemeMode.dark : ThemeMode.light;
    setState(() {});
  }

  void changeBackgroundImage(String imageUrl) {
    if (imageUrl.trim().isNotEmpty) {
      AppConstants.backgroundImageUrl = imageUrl;
      setState(() {});
    }
  }

  void changeEnterPincode(bool value) {
    AppConstants.checkPincode = !AppConstants.checkPincode;
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.amber,
        ),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: AppConstants.themeMode,
      home: AppConstants.checkPincode
          ? LockScreen(
            onPincodeChanged: changeEnterPincode,
              onThemeChanged: toggleThemeMode,
              onBackgroundImageChanged: changeBackgroundImage)
          : HomeScreen(
              onPincodeChanged: changeEnterPincode,
              onThemeChanged: toggleThemeMode,
              onBackgroundImageChanged: changeBackgroundImage),
    );
  }
}
