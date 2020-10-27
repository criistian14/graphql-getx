import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Utilities
import 'package:animelist/app/utils/size_config.dart';

// Libraries
import 'package:get/get.dart';

class ChangeTheme extends StatelessWidget {
  const ChangeTheme({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: () => _changeTheme(),
        padding: EdgeInsets.zero,
        minWidth: 0,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: _iconSwitchDarkMode(),
      ),
    );
  }

  // ====================================================================
  // Change Theme (Dark - Light)
  // ====================================================================
  void _changeTheme() {
    if (Get.isDarkMode) {
      Get.changeThemeMode(ThemeMode.light);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
    }
  }

  // ====================================================================
  // Icon Switch Dark Mode (iOS or Android)
  // ====================================================================
  Widget _iconSwitchDarkMode() {
    // Size Icon Switch (Responsive)
    double _sizeIcon = SizeConfig.safeBlockVertical * 3.4;
    if (SizeConfig.orientation == Orientation.landscape) {
      _sizeIcon = SizeConfig.safeBlockVertical * 9;
    }

    if (Platform.isIOS) {
      return Icon(
        Get.isDarkMode ? CupertinoIcons.sun_max_fill : CupertinoIcons.moon_fill,
        size: _sizeIcon,
        color: Colors.white,
      );
    }

    return Icon(
      Get.isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
      size: _sizeIcon,
      color: Colors.white,
    );
  }
}
