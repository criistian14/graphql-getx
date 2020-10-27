import 'dart:ui' as ui;
import 'package:animelist/app/utils/dependency_injection.dart';
import 'package:flutter/material.dart';

// Utilities
import 'app/utils/graphql_config.dart';

// Themes
import 'package:animelist/app/theme/app_theme.dart';
import 'package:animelist/app/theme/dark_theme.dart';

// Libraries
import 'package:get/route_manager.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

// Pages
import 'app/modules/splash/splash_page.dart';

// Binding
import 'package:animelist/app/modules/splash/splash_binding.dart';

// Routes
import 'package:animelist/app/routes/app_pages.dart';

// Translations
import 'app/utils/translations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.init();

  runApp(GraphQLProvider(
    client: GraphQLConfiguration.client,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'AnimeList',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: appThemeData,
      darkTheme: darkThemeData,
      home: SplashPage(),
      initialBinding: SplashBinding(),
      getPages: AppPage.pages,
      translations: AppTranslations(),
      locale: ui.window.locale,
    );
  }
}
