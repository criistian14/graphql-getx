import 'package:flutter/material.dart';

// Themes
import 'package:animelist/app/theme/text_theme.dart';

// Utilities
import 'package:animelist/app/utils/app_config.dart';

// Libraries
import 'package:tinycolor/tinycolor.dart';

final ThemeData appThemeData = ThemeData(
  brightness: Brightness.light,

  // Colors
  primaryColor: AppConfig.primaryColor,
  accentColor: Colors.black,
  scaffoldBackgroundColor: Colors.white,
  backgroundColor: Colors.white,
  unselectedWidgetColor: Colors.black38,

  // Fonts
  fontFamily: AppConfig.primaryFontFamily,
  textTheme: appTextTheme,

  // Text Fields
  inputDecorationTheme: InputDecorationTheme(
    fillColor: TinyColor.fromString("#8DBDE0").color,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide.none,
    ),
    focusColor: AppConfig.backgroundLightColor,
  ),

  // Buttons
  buttonColor: AppConfig.primaryColor,

  // Others
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
