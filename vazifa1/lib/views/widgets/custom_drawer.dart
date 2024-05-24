import 'package:flutter/material.dart';
import 'package:lesson43/utils/app_constants.dart';
import 'package:lesson43/views/screens/home_screen.dart';
import 'package:lesson43/views/screens/lock_screen.dart';
import 'package:lesson43/views/screens/settings_screen.dart';

class CustomDrawer extends StatelessWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onBackgroundImageChanged;
  final ValueChanged<bool> onPincodeChanged;
  const CustomDrawer({
    super.key,
    required this.onPincodeChanged,
    required this.onThemeChanged,
    required this.onBackgroundImageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppConstants.interfeysColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Mehmonxonalar",
                  style: TextStyle(
                      fontSize: AppConstants.textSize,
                      color: AppConstants.textColor),
                ),
                Text(
                  "MENYU",
                  style: TextStyle(
                      fontSize: AppConstants.textSize,
                      color: AppConstants.textColor),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return HomeScreen(
                      onPincodeChanged: onPincodeChanged,
                      onThemeChanged: onThemeChanged,
                      onBackgroundImageChanged: onBackgroundImageChanged,
                    );
                  },
                ),
              );
            },
            title: Text(
              "Bosh sahifa",
              style: TextStyle(
                  fontSize: AppConstants.textSize,
                  color: AppConstants.textColor),
            ),
            trailing: const Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return SettingsScreen(
                      onPincodeChanged: onPincodeChanged,
                      onThemeChanged: onThemeChanged,
                      onBackgroundImageChanged: onBackgroundImageChanged,
                    );
                  },
                ),
              );
            },
            title: Text(
              "Sozlamalar",
              style: TextStyle(
                  fontSize: AppConstants.textSize,
                  color: AppConstants.textColor),
            ),
            trailing: const Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
          ListTile(
            onTap: () {
              AppConstants.checkPincode
                  ? Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) {
                          return LockScreen(
                            onPincodeChanged: onPincodeChanged,
                            onThemeChanged: onThemeChanged,
                            onBackgroundImageChanged: onBackgroundImageChanged,
                          );
                        },
                      ),
                    )
                  : Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) {
                          return HomeScreen(
                            onPincodeChanged: onPincodeChanged,
                            onThemeChanged: onThemeChanged,
                            onBackgroundImageChanged: onBackgroundImageChanged,
                          );
                        },
                      ),
                    );
            },
            title: Text(
              "Yopish",
              style: TextStyle(
                  fontSize: AppConstants.textSize,
                  color: AppConstants.textColor),
            ),
            trailing: const Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
        ],
      ),
    );
  }
}
