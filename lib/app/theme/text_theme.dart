import 'package:flutter/material.dart';

// =====================================================================
// Light Theme
// =====================================================================
final TextTheme appTextTheme = TextTheme(
  headline1: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
  ),
  headline5: TextStyle(
    fontWeight: FontWeight.w600,
    wordSpacing: 2,
    letterSpacing: 1,
  ),
  subtitle2: TextStyle(
    color: Colors.black54,
  ),
  bodyText1: TextStyle(
    color: Colors.black54,
    letterSpacing: 1.2,
    wordSpacing: 1.3,
  ),
);

// =====================================================================
// Dark Theme
// =====================================================================
final TextTheme darkTextTheme = TextTheme(
  headline1: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
  ),
  headline5: TextStyle(
    fontWeight: FontWeight.w600,
    wordSpacing: 2,
    letterSpacing: 1,
  ),
  subtitle2: TextStyle(
    color: Colors.white60,
  ),
  bodyText1: TextStyle(
    color: Colors.white60,
    letterSpacing: 1,
    height: 1.6,
  ),
);
