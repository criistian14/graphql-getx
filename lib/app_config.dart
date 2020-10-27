import 'package:flutter/material.dart';

// Libraries
import 'package:tinycolor/tinycolor.dart';

class AppConfig {
  static int itemsPerPage = 12;

  // Fonts
  static final primaryFontFamily = "OpenSans";

  // Colors
  static final primaryColor = TinyColor.fromString("#5CA0D3").color;
  static final backgroundDarkColor = TinyColor.fromString("#2C3848").color;
  static final backgroundLightColor = TinyColor.fromString("#FFFFFF").color;
  static final baseLoadingColor = Colors.grey[300];
  static final highlightLoadingColor = Colors.grey[50];
}
