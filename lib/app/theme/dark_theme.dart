import 'package:flutter/material.dart';

// Themes
import 'package:animelist/app/theme/text_theme.dart';

// Utilities
import 'package:animelist/app/utils/app_config.dart';

// Libraries
import 'package:tinycolor/tinycolor.dart';

final ThemeData darkThemeData = ThemeData(
  brightness: Brightness.dark,

  // Colors
  primaryColor: AppConfig.primaryColor,
  accentColor: Colors.white,
  scaffoldBackgroundColor: AppConfig.backgroundDarkColor,
  backgroundColor: AppConfig.backgroundDarkColor,
  unselectedWidgetColor: Colors.white30,

  // Fonts
  fontFamily: AppConfig.primaryFontFamily,
  textTheme: darkTextTheme,

  // Text Fields
  inputDecorationTheme: InputDecorationTheme(
    fillColor: TinyColor.fromString("#8DBDE0").color,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide.none,
    ),
    focusColor: Colors.white,
  ),

  // Buttons
  buttonColor: TinyColor.fromString("#69727E").color,

  // Others
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
