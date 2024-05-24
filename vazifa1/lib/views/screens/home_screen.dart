import 'package:flutter/material.dart';
import 'package:lesson43/utils/app_constants.dart';
import 'package:lesson43/views/widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onBackgroundImageChanged;
  final ValueChanged<bool> onPincodeChanged;
  
  const HomeScreen({
    super.key,
    required this.onPincodeChanged,
    required this.onThemeChanged,
    required this.onBackgroundImageChanged,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.interfeysColor,
        title:  Text("Bosh Sahifa",style: TextStyle(fontSize: AppConstants.textSize,color: AppConstants.textColor),),
        actions: [
          DropdownButton(
    borderRadius: BorderRadius.circular(20),
    dropdownColor: AppConstants.interfeysColor,
    menuMaxHeight: 200,
    isDense: true,
    value: AppConstants.checkLanguage,
    items:  [
      DropdownMenuItem(
        value: 0,
        child: Text("Uz",style: TextStyle(fontSize: AppConstants.textSize,color: AppConstants.textColor),),
      ),
      DropdownMenuItem(
        value: 1,
        child: Text("Eng",style: TextStyle(fontSize: AppConstants.textSize,color: AppConstants.textColor),),
      ),
      DropdownMenuItem(
        value: 2,
        child: Text("Ru",style: TextStyle(fontSize: AppConstants.textSize,color: AppConstants.textColor),),
      ),
    ],
    onChanged: (value) {
      setState(() {
        AppConstants.checkLanguage = value!;
      });
    },
  )
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
      ),
    );
  }
}
