import 'dart:ui' as ui;
import 'package:flutter/material.dart';

// Utilities
import 'app_config.dart';
import 'graphql_config.dart';

// Libraries
import 'package:get/route_manager.dart';
import 'package:tinycolor/tinycolor.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

// Pages
import 'package:animelist/modules/splash/splash_page.dart';

// Translations
import 'package:animelist/utils/translations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(GraphQLProvider(
    client: GraphQLConfiguration.client,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // ====================================================================
  // Light Theme
  // ====================================================================
  ThemeData _lightTheme() {
    return ThemeData(
      brightness: Brightness.light,

      // Colors
      primaryColor: AppConfig.primaryColor,
      accentColor: Colors.black,
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      unselectedWidgetColor: Colors.black38,

      // Fonts
      fontFamily: AppConfig.primaryFontFamily,
      textTheme: TextTheme(
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
      ),

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
  }

  // ====================================================================
  // Dark Theme
  // ====================================================================
  ThemeData _darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,

      // Colors
      primaryColor: AppConfig.primaryColor,
      accentColor: Colors.white,
      scaffoldBackgroundColor: AppConfig.backgroundDarkColor,
      backgroundColor: AppConfig.backgroundDarkColor,
      unselectedWidgetColor: Colors.white30,

      // Fonts
      fontFamily: AppConfig.primaryFontFamily,
      textTheme: TextTheme(
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
      ),

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
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'AnimeList',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: _lightTheme(),
      darkTheme: _darkTheme(),
      home: SplashPage(),
      translations: AppTranslations(),
      locale: ui.window.locale,
    );
  }
}
